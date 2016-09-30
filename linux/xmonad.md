xmonad

Use xmonad and xmonad-contrib 0.10 to solve the focus problem when using java GUI programs, for example, IntelliJ IDEA.

Since xmonad 0.10 hasn't been released yet, we need to compile from source code.

Download source code using following commands, assuming you have darcs installed. darcs is a version control system that xmonad uses.

    darcs get http://code.haskell.org/xmonad
    darcs get http://code.haskell.org/XMonadContrib

Navigate to the downloaded xmonad source code folder, run following commands:

    runhaskell Setup.lhs configure --user --prefix=$HOME
    runhaskell Setup.lhs build
    runhaskell Setup.lhs install --user

It will install xmonad to $HOME/bin folder.

And then navigate to the downloaded XMonadContrib folder and run the three commands above also.

Then add 

    $HOME/bin/xmonad

to the last line of your .xsession or .xinitrc file.

Last, add import XMonad.Hooks.ICCCMFocus to the top of your xmonad.hs file. Then set logHook = takeTopFocus

My xmonad config file is attached.

REF:
http://code.google.com/p/xmonad/issues/detail?id=177
