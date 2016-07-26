(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; (auto-completion :variables
     ;;                  auto-completion-return-key-behavior nil
     ;;                  )
     ;; auto-completion

     clojure
     deft
     emacs-lisp
     eyebrowse
     git
     html
     markdown
     python
     razzishell

     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; (python
     ;;  :variables
      ;; python-enable-yapf-format-on-save t)
     ;; org

     (razzicompletion
        :variables auto-completion-enable-snippets-in-popup t)
     javascript
     term
     vc

     ;; tl

     ;; spell-checking
     ;; yntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   dotspacemacs-excluded-packages '(anaconda-mode evil-escape)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(
                         monokai
                         leuven
                         solarized-dark
                         spacemacs-light
                         solarized-light
                         spacemacs-dark
                         zenburn)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state t
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all
   ))

(defun dotspacemacs/user-init ()
  "This function is mostly useful for variables that need to be set
before packages are loaded."
  (setq-default
   scroll-margin 0)
  )

(defun razzi/insert-newline-after()
  (interactive)
  (evil-insert-newline-below)
  (forward-line -1))

(defun razzi/insert-newline-before()
  (interactive)
  (evil-insert-newline-above)
  (forward-line))

(defun razzi/select-symbol ()
  (interactive)
  (evil-visual-char)
  (evil-inner-symbol))

(defun razzi/abbrev-or-add-global-abbrev ()
  (interactive)
  (if (abbrev-expansion (thing-at-point 'word))
      (expand-abbrev)
    (inverse-add-global-abbrev 1)))

(defun razzi/transpose-previous-chars ()
  (interactive)
  (backward-char 1)
  (transpose-chars nil))

(defun razzi/append-comma ()
  (interactive)
  (evil-append 0 0 nil)
  (move-end-of-line nil)
  (insert ",")
  (evil-normal-state))

(defun razzi/edit-init ()
  (interactive)
  (find-file "~/.spacemacs.d/init.el"))

(defun save-if-buffer-is-file ()
  (if (buffer-file-name)
    (save-buffer)))

(defun razzi/transpose-next-line ()
  "Switch the current and next lines"
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(defun razzi/transpose-previous-line ()
  "Switch the current and previous lines"
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun razzi/put-before ()
  (interactive)
  (evil-with-single-undo
    (evil-insert-newline-above)
    (indent-for-tab-command)
    (insert (s-trim (current-kill 0)))
    (forward-line)))

(defun razzi/put-after ()
  (interactive)
  (evil-with-single-undo
    (evil-insert-newline-below)
    (indent-for-tab-command)
    (insert (s-trim (current-kill 0)))
    (forward-line)
    )
  )

(defun razzi/copy-paragraph ()
  (interactive)
  (move-beginning-of-line nil)
  (let ((sentence (thing-at-point 'defun)))
    (insert sentence)
    (insert "\n")
    ; TODO in python make this copy a method _or_ class!
    )
  )

(defun razzi/restart-emacs ()
  (interactive)
  (save-if-buffer-is-file)
  (mapcar 'delete-process (process-list))
  (restart-emacs))

(defun dotspacemacs/user-config ()
  ;; (set-face-background 'hl-line "#d3e9ff")
  (evil-leader/set-key
    "," 'razzi/append-comma
    "DEL" 'razzi/restart-emacs
    "f i" 'razzi/edit-init
    "i c" 'razzi/copy-paragraph
    "i d" 'razzi/put-debugger
    "o" 'razzi/put-after
    "C-o" 'razzi/put-before
    ;; "o d" 'razzi/put-debugger
    "v" 'razzi/select-symbol)

  (evil-set-initial-state 'term-mode 'insert)

  (setq save-abbrevs 'silently)

  (setq
    abbrev-file-name "~/.spacemacs.d/abbrev_defs.el"
    frame-title-format "%f"

    confirm-nonexistent-file-or-buffer nil
    kill-buffer-query-functions
      (delq 'process-kill-buffer-query-function kill-buffer-query-functions)

    powerline-default-separator 'nil
    )
  (setq-default
    abbrev-mode t
    ;todo doesn't take effect
    scroll-margin 0)


  ;; (spacemacs|use-package-add-hook company
  ;;   :post-init
  ;;   :pre-config
  ;;   :post-config
  ;;   )

  (global-set-key (kbd "C-`") 'describe-key)

  (define-key evil-insert-state-map (kbd "C-c a") 'razzi/abbrev-or-add-global-abbrev)
  (define-key evil-insert-state-map (kbd "C-h") 'sp-backward-delete-char)
  (define-key evil-insert-state-map (kbd "C-l") 'sp-slurp-hybrid-sexp)
  (define-key evil-insert-state-map (kbd "C-p") nil)
  (define-key evil-insert-state-map (kbd "C-t") 'razzi/transpose-previous-chars)
  ; todo conflict with yasnippet and company
  ; (define-key evil-insert-state-map (kbd "<tab>") 'hippie-expand)

  (define-key evil-normal-state-map (kbd "[ SPC") 'razzi/insert-newline-before)
  (define-key evil-normal-state-map (kbd "] SPC") 'razzi/insert-newline-after)
  (define-key evil-normal-state-map (kbd "[ c") 'git-gutter:previous-hunk)
  (define-key evil-normal-state-map (kbd "] c") 'git-gutter:next-hunk)
  (define-key evil-normal-state-map (kbd "TAB") 'spacemacs/alternate-buffer)
  (define-key evil-normal-state-map (kbd "-") 'razzi/transpose-next-line)
  (define-key evil-normal-state-map (kbd "_") 'razzi/transpose-previous-line)
  (define-key evil-normal-state-map (kbd "0") 'evil-first-non-blank)
  (define-key evil-normal-state-map (kbd "^") 'evil-digit-argument-or-evil-beginning-of-line)
  (define-key evil-normal-state-map (kbd "C-c C-z") 'nil)

  (define-key evil-operator-state-map (kbd "SPC") 'evil-inner-symbol)

  (define-key minibuffer-local-map (kbd "C-j") 'exit-minibuffer)

  (define-key isearch-mode-map (kbd "C-j") 'isearch-done)
  (define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)

 (use-package shell
    :config
    (evil-define-key 'insert shell-mode-map (kbd "C-h") 'term-send-del)
    (evil-define-key 'insert shell-mode-map (kbd "C-p") 'term-send-up))

  ;todo move to own layer
 ;todo hide 'staff' (group)
 ;todo . to move up directory
  (use-package dired
    :config
    (setq
     dired-recursive-copies 'always
     dired-recursive-deletes 'always)
    (define-key dired-mode-map (kbd "c") 'find-file)
    (define-key dired-mode-map (kbd "C-h") 'dired-up-directory)
    ;(dired-hide-details-mode)
    )

  (add-hook 'evil-insert-state-exit-hook 'save-if-buffer-is-file)
  (add-hook 'focus-out-hook 'garbage-collect)
  (add-hook 'focus-out-hook 'save-if-buffer-is-file)

  (defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
    "Create parent directory if not exists while visiting file."
    (unless (file-exists-p filename)
      (let ((dir (file-name-directory filename)))
        (unless (file-exists-p dir)
          (make-directory dir)))))

  )
; complain function which will put the string as a comment in a relevant config per mode
;disable the number of lines selected in modeline which seems to be slowing things down
