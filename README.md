# My little Emacs configuration

 I'm hoping that this will allow even people unfamiliar with emacs to get up and running quickly, being productive and seeing the power of emacs without having to invest the time into writing elisp, and hopefully getting bitten by the emacs bug. If not, that's fine too; enjoy editing in a pre-set and (hopefully) bug free environment.

## Installation

To install, simply `ln -s ~/dotemacs/emacs ~/.emacs`, changing `~/dotemacs/` depending on where you downloaded this to.

Upon starting up emacs, everything *should* just work. If not, open an issue on the wiki, and I'll get to it as soon as I can.

## Noobie guide

If, upon opening up emacs, everything seems too intimidating, or you would like to customize and tweak the features I have set up, then you'll want to go to `~/dotemacs/lisp/modes.el`, and you will see there the list of all the things which are being loaded on start. You can simply comment out the entire require-all statement, and then add packages as you desire. As a side note, the entries to require-all are the literal file names that are being loaded, and they should be in `~/dotemacs/lisp/`, so if you are curious about what a package does(or just want to modify it), you should be able to find the file there.

## More to come..
