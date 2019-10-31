# .spacemacs.d

```sh
# Install emacs application
$ brew tap d12frosted/emacs-plus
$ brew install emacs-plus
$ ln -s /usr/local/Cellar/emacs-plus/*/Emacs.app/ /Applications/
$ alias emacs='open -a /Applications/Emacs.app/'

# Install spacemacs
$ git clone --branch develop https://github.com/syl20bnr/spacemacs --depth 1 ~/.emacs.d
$ cd ~/.emacs.d
$ git reset --hard 7c572fccdcbabd1378f5342053aa15c27ab51e71

# Install this spacemacs config
$ git clone --recurse-submodules --remote-submodules https://github.com/razzius/.spacemacs.d ~/.spacemacs.d

# Ready to edit!
$ emacs ~/.spacemacs.d/init.el
```
