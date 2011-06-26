Introduction
------------

A raffling app based on the old [split-flap displays](http://en.wikipedia.org/wiki/Flap_display_board) (also known as [Solari departure boards](http://en.wikipedia.org/wiki/Solari_departure_board)).

It was used for [SCNA 2010](http://scna.softwarecraftsmanship.org/) book raffling and [RubyConf 2010](http://rubyconf.org/) giveaways.

How to use
----------

You'll need the following dependencies:

* JRuby 1.5.1 or higher
* [limelight executable](http://limelight.8thlight.com/main/download)
* limelight gem

Create two files in your home directory:

* solari.all
* solari.used

### solari.all

This file contains the list of all people participating in the raffle.

### solari.used

This file contains the list of all people picked as a winner.

### Run Program

In the repo directory, type <code>limelight open .</code>

The program runs full-screen.  To exit, press the appropriate shortcut keys to close application (e.g., Command + Q for Mac, Alt + F4 for Windows).

Credits
-------

[mab](http://www.freesound.org/usersViewSingle.php?id=127220) for the Solari departure board sound byte (Creative Commons).
