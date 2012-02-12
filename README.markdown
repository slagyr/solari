Introduction
------------

A raffling app based on the old [split-flap displays](http://en.wikipedia.org/wiki/Flap_display_board) (also known as [Solari departure boards](http://en.wikipedia.org/wiki/Solari_departure_board)).

It was used for [SCNA 2010](http://scna.softwarecraftsmanship.org/) book raffling and [RubyConf 2010](http://rubyconf.org/) giveaways.

How to use
----------

You will need the following dependencies:

* JRuby 1.5.1 or higher
* [limelight executable](http://limelight.8thlight.com/main/download)
* limelight gem

### solari.yml

This config file has three options:

1. `names_list_path` is the path where the `solari.all` and `solari.used` files live.  By default it points to the project's data directory.
2. `persist_used_names` takes a boolean value.  If set to true, all people picked as winners will be stored in this file and will persist across multiple Solari sessions.  If set to false, it will only persist in a single Solari session.
3. `play_sound` take a boolean value.  If set to true, it will play the Solari departure board sound.

### solari.all

Create this file if it does not already exist and add all the people participating in the raffle.

### solari.used

This file contains the list of all people picked as a winner (if the config option is turned on, see above)

### Run Program

In the repo directory, type <code>limelight open .</code>

To exit, press the appropriate shortcut keys to close application (e.g., Command + Q for Mac, Alt + F4 for Windows).

Credits
-------

[mab](http://www.freesound.org/usersViewSingle.php?id=127220) for the Solari departure board sound byte (Creative Commons).
