# .spacemacs.d

```sh
# Install emacs application
$ brew tap d12frosted/emacs-plus
$ brew install emacs-plus
$ brew link emacs-plus

# Enable connecting to running emacs or starting new emacs
# This is an implementation for the fish shell on MacOS. Find something that fits your environment
$ function ec
    emacsclient -n $argv ^/dev/null
    if test $status = 1
        open -a /Applications/Emacs.app/ -- $argv
    end
end
$ funcsave ec

# Install spacemacs
$ git clone --branch develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
$ cd ~/.emacs.d
$ git reset --hard 7c572fccdcbabd1378f5342053aa15c27ab51e71

# Install this spacemacs config
$ git clone --recurse-submodules --remote-submodules https://github.com/razzius/.spacemacs.d ~/.spacemacs.d

# Start emacs once to download packages, then remove a byte-compiled file. TODO fix this
$ /Applications/Emacs.app/Contents/MacOS/Emacs --eval '(kill-emacs)'
$ rm ~/.emacs.d/elpa/26.3/develop/vterm-toggle-20191029.631/vterm-toggle.elc

# Ready to edit!
$ emacs ~/.spacemacs.d/init.el
```
