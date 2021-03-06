(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'nil

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     (python :variables python-backend 'disabled)
     clojure
     go
     html
     java
     javascript
     markdown
     rust
     shell-scripts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     emacs-lisp
     git
     helm
     (osx :variables osx-swap-option-and-command t)
     ;; javascript
     ;; markdown
     multiple-cursors
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     (syntax-checking :variables
                      syntax-checking-enable-tooltips nil)
     treemacs

     helpful
     no-dots

     razzi
     razzi-dumb-jump
     razzi-focus-out
     razzi-helm
     razzi-import-it
     razzi-clojure
     razzi-javascript
     razzi-markdown
     razzi-mouse
     razzi-python
     razzi-tab-completion
     razzi-tabs
     razzi-vc
     razzi-vterm
     (version-control :variables
                      git-magit-status-fullscreen t
                      version-control-diff-tool 'git-gutter+
                      version-control-diff-side 'left))

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(general)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(anaconda-mode company-anaconda evil-escape importmagic clean-aindent-mode)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 19.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location nil

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%a"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))


(defun dotspacemacs/user-config ()
  "It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first.")

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (setq-default require-final-newline t
                evil-symbol-word-search t)

  (setq create-lockfiles nil
        custom-file "~/.emacs.d/custom.el"
        go-tab-width 4
        dired-recursive-deletes 'always
        evil-cross-lines t
        evil-ex-substitute-global t
        evil-insert-state-message nil
        evil-visual-state-message nil
        kill-buffer-query-functions nil
        ns-pop-up-frames nil
        vc-follow-symlinks nil)

  (setq exec-path (append (list (expand-file-name "~/.local/bin")) exec-path))

  (global-set-key (kbd "C-`") 'describe-key)
  (global-set-key (kbd "<C-tab>") 'centaur-tabs-forward)
  (global-set-key (kbd "<C-S-tab>") 'centaur-tabs-backward)

  (global-subword-mode)
  (menu-bar-mode -1)

  (evil-leader/set-key
    "'" 'razzi-vterm-split-vertically
    "," 'razzi-append-comma
    "1" 'centaur-tabs-select-beg-tab
    "2" 'centaur-tabs-select-visible-tab
    "3" 'centaur-tabs-select-visible-tab
    "9" 'centaur-tabs-select-end-tab
    "ESC" 'with-editor-finish
    "O" 'razzi-put-before
    "RET" 'razzi-split-after-comma
    "SPC" 'helm-M-x
    "TAB" 'spacemacs/alternate-buffer
    "[" 'evil-open-above
    "`" 'razzi-toggle-true-false
    "e n" 'flycheck-next-error
    "e p" 'flycheck-previous-error
    "f RET" 'spacemacs/projectile-copy-file-path
    "f SPC" 'spacemacs/copy-file-path
    "f d" 'spacemacs/delete-current-buffer-file
    "f i" 'spacemacs/find-dotfile
    "f n" 'spacemacs/copy-file-name
    "f p" 'razzi-python/copy-test-file-path
    "f u" 'razzi-python/copy-test-method-path
    "g n" 'centaur-tabs-forward-group
    "g p" 'centaur-tabs-backward-group
    "i b" 'razzi-python-black
    "i c" 'razzi-duplicate-paragraph
    "i d" 'razzi-put-debugger
    "i e" 'iedit-mode
    "i f" 'razzi-python-autoflake
    "i g" 'razzi-python-gray
    "i i" 'razzi-import-it-import-this
    "i n" 'evil-ex-nohighlight
    "i s" 'razzi-python-isort
    "o" 'razzi-put-after
    "q b" 'razzi-close-all-file-buffers
    "q r" 'razzi-restart-emacs
    "t DEL" 'centaur-tabs-kill-all-buffers-in-current-group)

  (general-define-key :states '(normal insert)
                      "M-h" 'ns-do-hide-emacs
                      "M-q" 'spacemacs/prompt-kill-emacs
                      "C-c C-c" 'with-editor-finish
                      "M-1" 'centaur-tabs-select-beg-tab
                      "M-2" 'centaur-tabs-select-visible-tab
                      "M-3" 'centaur-tabs-select-visible-tab
                      "M-4" 'centaur-tabs-select-visible-tab
                      "M-5" 'centaur-tabs-select-visible-tab
                      "M-6" 'centaur-tabs-select-visible-tab
                      "M-7" 'centaur-tabs-select-visible-tab
                      "M-8" 'centaur-tabs-select-visible-tab
                      "M-9" 'centaur-tabs-select-end-tab)

  (general-define-key "M-`" 'razzi-vterm-toggle
                      "C-<tab>" 'centaur-tabs-forward
                      "C-M-<tab>" 'centaur-tabs-move-current-tab-to-right
                      "C-M-S-<tab>" 'centaur-tabs-move-current-tab-to-left
                      "C-SPC" nil
                      "C-SPC C-k" 'windmove-up
                      "C-SPC RET" 'windmove-down
                      "C-SPC %" 'razzi-vterm-split-horizontally
                      "C-SPC c" 'razzi-vterm-new
                      "C-SPC h" 'windmove-left
                      "C-SPC j" 'windmove-down
                      "C-SPC k" 'windmove-up
                      "C-SPC l" 'windmove-right
                      "C-SPC n" 'centaur-tabs-forward
                      "C-SPC p" 'centaur-tabs-backward
                      "M--" 'spacemacs/scale-down-font
                      "M-=" 'spacemacs/scale-up-font
                      "M-/" 'evilnc-comment-or-uncomment-lines
                      "M-w" 'kill-current-buffer
                      "M-z" 'razzi-undo
                      "C-S-<tab>" 'centaur-tabs-backward)

  (general-define-key :states 'normal
                      ;; "<tab>" 'flycheck-next-error
                      "!" 'evil-ex-sort
                      "-" 'move-text-down
                      "0" 'evil-first-non-blank
                      "c" (general-key-dispatch 'evil-change
                            "ru" 'string-inflection-upcase
                            "rs" 'string-inflection-underscore
                            "rt" 'string-inflection-camelcase
                            "rc" 'string-inflection-lower-camelcase
                            "rd" 'string-inflection-kebab-case)
                      "C" 'razzi-change-line
                      "C-M-;" 'eval-expression
                      "C-SPC '" 'razzi-vterm-toggle
                      "C-SPC SPC" 'spacemacs/alternate-buffer
                      "C-SPC \"" #'razzi-vterm-split-vertically
                      "C-h" 'windmove-left
                      "C-l" 'windmove-right
                      "D" 'razzi-kill-line-and-whitespace
                      "K" 'evil-previous-line  ; Protect against typo
                      "M-RET" 'lisp-state-eval-sexp-end-of-line
                      "M-T" 'reopen-killed-file
                      "M-[" 'evil-backward-paragraph
                      "M-]" 'evil-forward-paragraph
                      "M-c" 'quick-copy-line
                      "M-o" 'razzi-open-sexp-below
                      "M-r" 'raise-sexp
                      "M-s" 'razzi-flycheck-and-save-buffer
                      "Q" 'razzi-replay-q-macro
                      "_" 'move-text-up
                      "g /" 'spacemacs/helm-project-smart-do-search-region-or-symbol
                      "g T" 'centaur-tabs-backward
                      "g [" 'dumb-jump-go-prompt
                      "g ]" 'razzi-dumb-jump-go
                      "g b" 'magit-blame-addition
                      "g f" 'razzi-go-to-file-at-point
                      "g s" 'razzi-save-and-magit-status
                      "g t" 'centaur-tabs-forward
                      "p" 'evil-paste-after
                      "ZZ" 'with-editor-finish)

  ;; Disable C-p yasnippet behavior by removing hippie-expand definition
  (define-key evil-insert-state-map [remap evil-complete-previous] nil)

  (general-define-key :states 'insert
                      "M-s" 'razzi-exit-insert-and-save
                      "M-RET" 'lisp-state-eval-sexp-end-of-line
                      "M-v" 'yank
                      "M-t" 'transpose-words
                      "M-o" 'sp-end-of-next-sexp
                      "H-<backspace>" 'backward-kill-word  ; this is because I have system-wide C-w -> H-<backspace>
                      "C-a" 'beginning-of-line
                      "C-c a" 'razzi-abbrev-or-add-global-abbrev
                      "C-d" 'delete-forward-char
                      "C-e" 'end-of-line
                      "C-k" 'kill-line
                      "C-t" 'razzi-transpose-previous-chars
                      "<tab>" 'razzi-tab-completion-tab-complete
                      "H-<left>" 'backward-word
                      "H-<right>" 'forward-word
                      "C-h" 'delete-backward-char
                      "C-i" 'razzi-expand-line
                      "C-l" 'sp-slurp-hybrid-sexp
                      "C-;" 'sp-forward-barf-sexp)

  (general-define-key :states '(normal visual)
                      "gx" 'browse-url-at-point)

  (evil-define-text-object whole-buffer (count &optional beginning end type)
    (evil-range 0 (point-max)))

  (define-key input-decode-map "\C-i" [C-i])
  (define-key evil-insert-state-map [C-i] 'razzi-expand-line)

  (defun razzi-expand-line ()
    (interactive)
    (let ((hippie-expand-try-functions-list '(try-expand-line
                                              try-expand-line-all-buffers)))
      (call-interactively 'hippie-expand)))

  (mapc 'evil-declare-not-repeat '(flycheck-next-error flycheck-previous-error razzi-flycheck-and-save-buffer evil-ex-search-next evil-ex-search-previous))

  (general-define-key :states 'visual
                      "$" 'evil-last-non-blank
                      "0" 'evil-first-non-blank
                      "K" 'evil-previous-line  ; Protect against typo
                      "c" 'evil-change
                      "v" 'evil-normal-state)

  (general-define-key :states 'operator
                      "E" 'forward-symbol
                      "ae" 'whole-buffer
                      "SPC" 'evil-inner-symbol)

  (general-define-key "M-e" 'fill-paragraph)

  ; todo integrate this
  (defvar killed-file-list nil
    "List of recently killed files.")

  (defun add-file-to-killed-file-list ()
    "If buffer is associated with a file name, add that file to the
`killed-file-list' when killing the buffer."
    (when buffer-file-name
      (push buffer-file-name killed-file-list)))

  (add-hook 'kill-buffer-hook #'add-file-to-killed-file-list)

  (defun reopen-killed-file ()
    "Reopen the most recently killed file, if one exists."
    (interactive)
    (when killed-file-list
      (find-file (pop killed-file-list)))))

(defmacro measure-time (&rest body)
  "Measure the time it takes to evaluate BODY."
  `(let ((time (current-time)))
     ,@body
     (message "%.06f" (float-time (time-since time)))))

; would be great to remove color themes etc to see why vi in vterm is showing up blank

; todo move this out
(defun quick-copy-line ()
  "Copy the whole line that point is on and move to the beginning of the next line.
    Consecutive calls to this command append each line to the
    kill-ring."
  (interactive)
  (let ((beg (line-beginning-position 1))
        (end (line-beginning-position 2)))
    (if (eq last-command 'quick-copy-line)
        (kill-append (buffer-substring beg end) (< end beg))
      (kill-new (buffer-substring beg end))))
  (beginning-of-line 2))


; coming back to vterm buffer makes it go to copy mode?
; spc i a import all
