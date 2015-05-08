file pfkerm.msg

     This contains some email correspondence between me
(Frank Sergeant) and Frank da Cruz which augments and
corrects my discussion of Kermit in my article "A Simple
Implementation of the Kermit Protocol in Pygmy Forth".
The email headers have been kept intact (except for
wrapping to no more than 80 columns) to make it easier for
you to follow who is saying what and when.  The complete
package of files related to this article should be
available on my web site

         http://www.eskimo.com/~pygmy/pfkerm.doc)

and on the Kermit ftp site

  ftp://kermit.columbia.edu/kermit/c/pf*               (for text files)
  ftp://kermit.columbia.edu/kermit/archives/pfkerm.zip (for the zip file)

  -- Frank Sergeant
  8 November 1997

[ Note, April, 2007 -- my web site is now pygmy.utoh.org and the
  Kermit files are included in Pygmy version 1.7 ]


From fdc@watsun.cc.columbia.edu Wed Aug 13 09:47:08 1997
Received: from poboxer.pobox.com (poboxer.pobox.com [208.210.124.21])
  by mx2.eskimo.com (8.8.5/8.6.12) with ESMTP id JAA26079
  for <pygmy@eskimo.com>; Wed, 13 Aug 1997 09:47:02 -0700 (PDT)
Received: from watsun.cc.columbia.edu
  (cu41841@watsun.cc.columbia.edu [128.59.39.2])
     by poboxer.pobox.com (8.8.5/8.8.5) with ESMTP id MAA13352
     for <pygmy@pobox.com>; Wed, 13 Aug 1997 12:45:49 -0400
Received: (from fdc@localhost)
     by watsun.cc.columbia.edu (8.8.5/8.8.5) id MAA03983;
     Wed, 13 Aug 1997 12:45:49 -0400 (EDT)
Date: Wed, 13 Aug 97 12:45:48 EDT
From: Frank da Cruz <fdc@watsun.cc.columbia.edu>
To: pygmy@pobox.com
Subject: Re: Kermit in Forth
In-Reply-To: Your message of Tue, 12 Aug 1997 13:31:35 -0500
Message-ID: <CMM.0.90.4.871490748.fdc@watsun.cc.columbia.edu>
Status: R
X-Status: A

> The actual Kermit protocol code is in the files KERMIT.SCR
> (source code) and KERMIT.DOW (shadow or documentation) files
> plus the text of my article in KERMIT.TXT.
>
OK, I've got them now, thanks!

> I suppose the article (KERMIT.TXT) would be the best file to start
> reading.
>
OK, thanks.  Btw, here are a few corrections for your article, although
I suppose it's too late now.

    Kermit is not only the name of Henson Associates Inc's
    famous frog but also the name of an extensive and complex
    file transfer/remote computer access application written by
    Columbia University and/or volunteers (as I understand it)
    and sold and distributed by Columbia University [1].

The implication that Kermit is "sold" and/or "not free" is something of
an oversimplification.  There are hundreds of different Kermit programs,
and each one might have a different copyright status.  The most popular
versions are "free" in the sense that you can get and use them for free,
but we also ask you to purchase the corresponding manual (for the good
reasons that sales of these manuals are what support our continuing
support and development work, and that they show you how to use the
software), but they are "not free" in the sense that you can't resell
them, bundle them with a product, etc, without licensing them.  The
details are all on our website:

  http://www.columbia.edu/kermit/

and in particular:

  http://www.columbia.edu/kermit/licensing.html

    ... ZMODEM is usually considered to be the best
    although there seem to be arguments between the kermit and
    ZMODEM camps as to which is the better, faster protocol
    under various circumstances.  I, personally, found the
    ZMODEM arguments more persuasive...

Did you look at:

  http://www.columbia.edu/kermit/perf.html

which is a set of benchmarks of Kermit and XYZMODEM.  Also, did you
know there is an entire book on the subject, "The Working Programmer's
Guide to Serial Protocols", by Tim Kienzle?

    Similarly, the
    use of Columbia University's Kermit product would have
    required each customer to purchase a license for it (yes, it
    is NOT free).

Again, it depends on which version.

    The Kermit Protocol

    My main guide for the Kermit protocol was _C
    Programmer's Guide to Serial Communications_ by Joe Campbell
    [2].  Note, there are some errors in Campbell's examples.

The definitive protocol reference is:

Frank da Cruz, "Kermit, A File Transfer Protocol", Digital Press /
Butterworth Heinemann, Woburn, MA, 1987, 379 pages, ISBN 0-932376-88-6.

    Kermit
    would allow for transmitting 7-bit data bytes by escaping,
    with an ampersand, each byte with a high bit set and then
    clearing that high bit, but we do not do this.

There is also a much more efficient (but more complicated) locking
shift method.

    Unfortunately, not all
    implementations of Kermit respect the request not to use
    repeat counts.

Which ones did you find that didn't do this?

I'd be curious to know more about what's going on with Forth?  I take it
that Forth is an "enclosed environment" that runs on various platforms,
and the same Kermit program runs on the platforms where the Forth
environment runs?  Can you list them?

Finally, would you want to write an announcement for your Kermit version
that can be posed on the Kermit newsgroup?

Thanks again!

- Frank



From: pygmy@eskimo.com (Frank Sergeant)
To: fdc@watsun.cc.columbia.edu
Subject: Re: Kermit in Forth
Date: Mon, 18 Aug 1997 14:32:43 -0500
Reply-To: pygmy@pobox.com
Message-ID: <bNK+zYv1uc9T084yn@eskimo.com>
In-Reply-To: <CMM.0.90.4.871490748.fdc@watsun.cc.columbia.edu>
Lines: 126
X-Status: U

Dear Frank,

> OK, thanks.  Btw, here are a few corrections for your article, although
> I suppose it's too late now.

     Thanks for the corrections and further
information.  It is too late for the article in
_Forth Dimensions_, as the issue has already come
out.  However, if it is ok with you, what I might
do is add your letter to the pygmy15.zip file and
mention on my web site that the additional
information is available.

> The implication that Kermit is "sold" and/or "not free" is something of
> an oversimplification.  There are hundreds of different Kermit programs,
> and each one might have a different copyright status.  The most popular
> versions are "free" in the sense that you can get and use them for free,
> but we also ask you to purchase the corresponding manual (for the good
              ^^^
...
> software), but they are "not free" in the sense that you can't resell
> them, bundle them with a product, etc, without licensing them.  The
        ^^^^^^^^^^^^^^^^^^^^^^^^^^

     Well, that is more or less my point.  I don't
see how we can ask our clients to each ftp a copy
of the program, so we would seem to need to give
them a copy (which I suppose comes under the
category of "bundle").  As I read the licensing
information, the simplest way would be for us to
also buy each of them the _Using MS-DOS Kermit_
book.  To me, that seems equivalent to saying that
(your primary MS-DOS Kermit distribution) it is
"sold" and/or "not free".  Perhaps I'm overlooking
some subtle distinction, but that seems to me to
be the pratical effect.  Still, I am not sure that
that wouldn't have been best after all, but it was
one more complexity I was trying to avoid.
Obviously, the full Kermit is an impressive
system.  I hope to look into it more fully,
eventually.

>     ... ZMODEM is usually considered to be the best
...
> Did you look at:
>
>   http://www.columbia.edu/kermit/perf.html
>
> which is a set of benchmarks of Kermit and XYZMODEM.

     I have now forgotten what I did look at.  I
believe I read something from the columbia site
and then read a rebuttal of it from the Oman site.

> Also, did you
> know there is an entire book on the subject,
> "The Working Programmer's
> Guide to Serial Protocols", by Tim Kienzle?

     I have seen title mentioned, but I haven't
seen the book.  Do you recommend it?

> The definitive protocol reference is:
>
> Frank da Cruz, "Kermit, A File Transfer Protocol",
> Digital Press /
> Butterworth Heinemann, Woburn, MA, 1987, 379 pages,
> ISBN 0-932376-88-6.

     And I wish I'd had it to hand at the time.

>     Unfortunately, not all
>     implementations of Kermit respect the request not to use
>     repeat counts.
>
> Which ones did you find that didn't do this?

     It was a version of Kermit from some years
ago running on a '486.  I got it, basically
already set up, from Southwest Texas State
University for use in connecting to their VAX.
I can't get version information from it now as I
have since reformatted the hard disk.

> I'd be curious to know more about what's going on
> with Forth?  I take it that Forth is an "enclosed
> environment" that runs on various platforms, and
> the same Kermit program runs on the platforms
> where the Forth environment runs?  Can you list
> them?

     At first, Forth was its own operating system
and could run with very minimal hardware
resources.  It is used extensively in embedded
systems (controlling the Saudi Arabian airport,
running the FedX handheld gizmos) as its own
"enclosed environment".  In other areas, it
usually runs under a host OS these days.  It is
available for nearly every environment.  It is in
the low-level boot ROM on Sun workstations, used
for initial device configuration (although this is
running before Unix comes up).  There are several
versions running under Unix and Linux, Windows,
DOS, the Mac, etc.  One of its first major
applications was controlling radio telescopes and
manipulating their data.  Pygmy Forth runs in DOS,
using DOS or BIOS calls for its I/O.  It seems to
run in just about any DOS box (under Windows 3.1,
Windows 95, OS/2, or Linux's dos emulator).  So,
the only environment Pygmy Forth runs in is DOS.
The KERMIT.SCR code almost certainly could not be
loaded unchanged into a different Forth, but I
hope it captures the essence of the algorithm so
that it would not be very hard to port to a
different Forth or to different hardware.  (Did
this answer the question?)

> Finally, would you want to write an announcement
> for your Kermit version that can be posed on the
> Kermit newsgroup?

     I'll be glad to.  I'll search for 'kermit'
next time I'm reading news and try to find the
appropriate group and then post something.

  -- Frank



From fdc@watsun.cc.columbia.edu Mon Aug 18 14:56:44 1997
Received: from poboxer.pobox.com (poboxer.pobox.com [208.210.124.21])
     by mx1.eskimo.com (8.8.5/8.6.12) with ESMTP id OAA21324
     for <pygmy@eskimo.com>; Mon, 18 Aug 1997 14:56:27 -0700
Received: from watsun.cc.columbia.edu
     (cu41841@watsun.cc.columbia.edu [128.59.39.2])
     by poboxer.pobox.com (8.8.5/8.8.5) with ESMTP id RAA20751
     for <pygmy@pobox.com>; Mon, 18 Aug 1997 17:56:25 -0400
Received: (from fdc@localhost)
     by watsun.cc.columbia.edu (8.8.5/8.8.5) id RAA20868;
     Mon, 18 Aug 1997 17:56:24 -0400 (EDT)
Date: Mon, 18 Aug 97 17:56:24 EDT
From: Frank da Cruz <fdc@watsun.cc.columbia.edu>
To: pygmy@pobox.com
Subject: Re: Kermit in Forth
In-Reply-To: Your message of Mon, 18 Aug 1997 14:32:43 -0500
Message-ID: <CMM.0.90.4.871941384.fdc@watsun.cc.columbia.edu>
Status: R
X-Status: R

>      Thanks for the corrections and further
> information.  It is too late for the article in
> _Forth Dimensions_, as the issue has already come
> out.  However, if it is ok with you, what I might
> do is add your letter to the pygmy15.zip file and
> mention on my web site that the additional
> information is available.
>
That's fine.

> > The implication that Kermit is "sold" and/or "not free" is something of
> > an oversimplification.  There are hundreds of different Kermit programs,
> > and each one might have a different copyright status.  The most popular
> > versions are "free" in the sense that you can get and use them for free,
> > but we also ask you to purchase the corresponding manual (for the good
>               ^^^
> ...
> > software), but they are "not free" in the sense that you can't resell
> > them, bundle them with a product, etc, without licensing them.  The
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>      Well, that is more or less my point.  I don't
> see how we can ask our clients to each ftp a copy
> of the program, so we would seem to need to give
> them a copy (which I suppose comes under the
> category of "bundle").  As I read the licensing
> information, the simplest way would be for us to
> also buy each of them the _Using MS-DOS Kermit_
> book.  To me, that seems equivalent to saying that
> (your primary MS-DOS Kermit distribution) it is
> "sold" and/or "not free".
>
The distinction is between end users and "resellers".
For end users, these programs are free.  For resellers
(even if they are not actually selling), they are not
free.  There is a long history behind this that takes
a long time to explain, but briefly: we used to be
funded to do this work, but we aren't any more, so we
have to pay for the Kermit Project out of income.  Our
work includes tech support -- unlike FSF, etc, we
provide end-user support, and in fact this takes up
most of our time each day.  If you (generic "you") can
take our software and give it away to your customers
or clients without documentation, this gives you
commercial advantage at our expense, since many of
your users will ask us for assistance.  On the other
hand, if you provide them with manuals, then (a) they
are less likely to ask us for help, and (b) we get
some income to keep our work going.

> > ... ZMODEM is usually considered to be the best
> ...
> > Did you look at:
> >
> >   http://www.columbia.edu/kermit/perf.html
> >
> > which is a set of benchmarks of Kermit and XYZMODEM.
>
> I have now forgotten what I did look at.  I
> believe I read something from the columbia site
> and then read a rebuttal of it from the Oman site.
>
Right -- there is a rebuttal there, but it doesn't hold
a lot of water.  There was a prolonged debate on the
newsgroups after this, that finally settled down after
a couple years.  The bare fact is, there is precious
little difference between Zmodem and Kermit in terms of
performance on a perfect connection (8-bit clean, no
noise, transparent to all control characters), but there
is a big difference on all other types of connections.

> > Also, did you
> > know there is an entire book on the subject,
> > "The Working Programmer's
> > Guide to Serial Protocols", by Tim Kienzle?
>
> I have seen title mentioned, but I haven't
> seen the book.  Do you recommend it?
>
It's pretty good technically, and fair and impartial
in the protocol wars.  Yes, I do recommend it.

> ...different Forth or to different hardware.  (Did
> this answer the question?)
>
Yes -- I like stories like that.  We have a lot of them
with Kermit too -- odd gadgets where it is embedded, etc
(fast-food cash registers, hand-held bar-code scanners,
even pacemakers...)

> > Finally, would you want to write an announcement
> > for your Kermit version that can be posed on the
> > Kermit newsgroup?
>
> I'll be glad to.  I'll search for 'kermit'
> next time I'm reading news and try to find the
> appropriate group and then post something.
>
The newsgroups are comp.protocols.kermit.misc and
comp.protocols.kermit.announce; the latter is moderated.

Let's coordinate on this, since you'll need to tell
them where to find it and what it's called, etc, in
the Kermit archive.

There's the ZIP file, but then we usually like to put
up the source code and docs as plain text for various
reasons; in this case maybe somebody wants to port it
to another environment where there is no UNZIP, etc.
Can a Forth program be saved as plain ASCII text?

Thanks again!

- Frank

(end of file pfkerm.msg)
