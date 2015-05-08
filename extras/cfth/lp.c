/*  lp.c   "Load Pygmy"    by Frank Sergeant
                              frank@pygmy.utoh.org

      This is an example of co-ordinating Pygmy with C,
      to allow Pygmy to call C subroutines and access
      C variables.

      To compile and link lp.c with Borland C/C++ version 4.5
      from the command line, use the following command

            bcc -v -1- -mh -p- -tDe lp.c graphics.lib

      The options say to turn on debugging, to restrict the
      instructions to that of an 8086, to compile for the
      "huge" model, and to create a DOS .EXE file that also
      links in the graphics library.

      This program is an example of how to make C library
      functions available to Forth.  Simply put the names
      of the desired functions into the pointers table
      but without the ending "()".  Similarly, the addresses
      of C structures may be placed in the table.

      This example shows how Borland's BGI (graphics) routines
      may be used by Forth.
*/


#include <stdio.h>
#include <string.h>
#include <process.h>
#include <dos.h>
#include <graphics.h>

#include <stdlib.h>
#include <malloc.h>
#include <fcntl.h>
#include <io.h>
#include <conio.h>


// declare a function to be defined in this file
int tst (int a, int b);

// Declare several variables whose addresses will be
//    passed to Forth.  All except j have some use
//    in connection with the graphics functions.
int j;
int gdriver, gmode, textfont, textdir;


main (int argc, char * argv[]) {

  int handle, file_size, temp;
  char * filename = {"PYGMYC.COM"};      // default file name

  int exit_status;

  char *realbuffer;    // Allot a 64K byte buffer to hold the Forth image.
  char *loadbuffer;    // Adjust this pointer to a proper SEG:OFF where the
                       //  offset is zero.  It will point to the first byte
                       //  in realbuffer that is paragraph aligned.
  char forthstr[80];   // Staging area for Forth command strings
  char *commandline;   // will point to 0x80 into loadbuffer
  int (*forth)(void);  // declare forth to be a pointer to a function
                       //  that returns an integer.

  // This is the Table that Forth's CTABLE variable will point to.
  //  Note the index values in the rightmost column in the comments.
  void *pointers[] =
  {
       (void *) &j,                         // integer        0
       (void *) tst,                        // function       1
       (void *) initgraph,                  // function       2
       (void *) closegraph,                 // function       3
       (void *) getgraphmode,               // function       4
       (void *) setgraphmode,               // function       5
       (void *) restorecrtmode,             // function       6
       (void *) graphdefaults,              // function       7
       (void *) graphresult,                // function       8
       (void *) getmaxcolor,                // function       9
       (void *) setcolor,                   // function      10
       (void *) putpixel,                   // function      11
       (void *) line,                       // function      12
       (void *) linerel,                    // function      13
       (void *) lineto,                     // function      14
       (void *) moverel,                    // function      15
       (void *) moveto,                     // function      16
       (void *) circle,                     // function      17
       (void *) settextstyle,               // function      18
       (void *) outtext,                    // function      19
       (void *) outtextxy,                  // function      20
       (void *) &gdriver,                   // integer       21
       (void *) &gmode,                     // integer       22
       (void *) &textfont,                  // integer       23
       (void *) &textdir                    // integer       24
  };


  // allocate memory for the Forth segment
  realbuffer = malloc(65535);

  // Walk forward in that segment until a paragraph (16 byte)
  //  boundary is reached.
  temp = FP_OFF(realbuffer);
  if ( temp % 16 )                      // if not paragraph aligned,
     temp +=  16 -  (temp % 16);        //   then align it
  loadbuffer = MK_FP ( FP_SEG (realbuffer) + temp / 16, 0 );

  forth = (void *) (loadbuffer + 0x100);  // entry point is + 256 bytes
  commandline = loadbuffer + 0x80;        // command line is + 128 bytes

  // collect alternate Forth image file name from the
  //   command line, if present
  if (argc == 2) strcpy(filename, argv[1]);

  // load the Forth image into the segment allocated for it
  handle = open( filename, O_RDONLY | O_BINARY);
  if ( handle != -1) {
     file_size = filelength(handle);
        read ( handle, loadbuffer+0x100, file_size);
        close (handle);
  }
  else
      puts("File could not be opened\n");


  // set up some variables Forth will use when calling graphics routines
  gdriver  = DETECT;
  textfont = TRIPLEX_FONT;
  textdir  = HORIZ_DIR;

  // Build a string at forthstr which will be INTERPRETed by Forth
  //   to make Forth's CTABLE variable hold the address of the
  //   pointer table.
  sprintf(forthstr, " %d %d  CTABLE 2! \r",
                  FP_SEG(pointers), FP_OFF(pointers) );

  // Copy that string where Forth expects to find a "command line"
  strcpy(commandline+1, forthstr);

  // Plug in the length of the "command line"
  commandline[0] = (char) (strlen(forthstr)-1);

  // Call Forth as a C subroutine
  exit_status = forth();

  printf("The returned exit status is %d\n", exit_status);
  printf("The value of j is %d\n", j);

  free (realbuffer);
  return;
}

// Following is a dummy function to allow us to inspect
//   the exact calling protocol used by C
int tst (int a, int b) {

   static int k = 7;
   int c;

   c = a + b + k++;
   return c;
}

