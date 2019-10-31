# .spacemacs.d

```sh
# Install emacs application
$ brew tap d12frosted/emacs-plus
$ brew install emacs-plus
$ ln -s /usr/local/Cellar/emacs-plus/*/Emacs.app/ /Applications/
$ alias emacs='open -a /Applications/Emacs.app/'

# Install spacemacs
$ git clone https://github.com/syl20bnr/spacemacs --depth 1 ~/.emacs.d
$ cd ~/.emacs.d
$ git checkout 09af9fc40b695a22cb6a3f59d61b3c23aed6fa79

# Install this spacemacs config
$ git clone --recurse-submodules --remote-submodules https://github.com/razzius/.spacemacs.d ~/.spacemacs.d

# Ready to edit!
$ emacs ~/.spacemacs.d/init.el
```
