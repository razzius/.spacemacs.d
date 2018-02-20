(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   dotspacemacs-configuration-layers
   '(auto-completion
     clojure
     csv
     emacs-lisp
     fsharp
     git
     go
     haskell
     html
     javascript
     lua
     markdown
     osx
     python
     ruby
     rust
     shell-scripts
     sql
     swift
     yaml

     razzishell
     razzi-clojure
     razzi-dired
     razzi-helm
     razzi-isearch
     razzi-javascript
     razzi-projectile
     razzi-python
     razzi-tab-completion
     razzi-vc
     ; razzilisp
     razzineotree
     razzicompletion

     term

     ;; org
     (syntax-checking :variables syntax-checking-enable-tooltips nil))
   dotspacemacs-excluded-packages '(anaconda-mode evil-escape eldoc archive-mode)
   dotspacemacs-additional-packages '(super-save
                                      buffer-move
                                      monroe
                                      evil-terminal-cursor-changer
                                      flycheck-mypy
                                      multiple-cursors
                                      pyenv-mode
                                      restclient
                                      string-inflection
                                      virtualenvwrapper
                                      apib-mode
                                      general)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-themes '(leuven
                         monokai
                         solarized-dark
                         spacemacs-light
                         solarized-light
                         spacemacs-dark
                         zenburn)
   dotspacemacs-default-font '("Bitstream Vera Sans Mono"
                               :size 17.9
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key "M-,"
   dotspacemacs-major-mode-emacs-leader-key "C-SPC"
   dotspacemacs-distinguish-gui-tab t
   dotspacemacs-command-key ":"
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   dotspacemacs-enable-paste-micro-state t
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-smartparens-strict-mode t
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   ;todo replace with git hook(s)
   dotspacemacs-whitespace-cleanup 'nil))

(defun dotspacemacs/user-init ()
  "This function is mostly useful for variables that need to be set
before packages are loaded."
  (setq
   custom-file "~/.emacs.d/custom.el"
   helm-mode-fuzzy-match t
   helm-ff-newfile-prompt-p nil
   helm-M-x-fuzzy-match t)
  (load custom-file 'noerror))

(defun razzi/insert-newline-after()
  (interactive)
  (save-excursion
    (evil-insert-newline-below)
    (forward-line -1)))

(defun razzi/insert-newline-before()
  (interactive)
  (save-excursion
    (evil-insert-newline-above)
    (forward-line)))

(defun razzi/voice ()
  (interactive)
  ;; (shell-command "swift ~/projects/swift_speech/r2.swift")
  (start-process "voice" "voice" "swift" "/Users/razzi/projects/swift_speech/r2.swift"))

(defun razzi/dictate ()
  (interactive)
  (start-process "dictate" "dictate" "osascript" "/Users/razzi/projects/swift_speech/dictate.applescript"))

(defun razzi/end-voice ()
  (interactive)
  (delete-process "voice"))

(defun razzi/abbrev-or-add-global-abbrev ()
  (interactive)
  (if (abbrev-expansion (thing-at-point 'word))
      (progn
        (expand-abbrev)
        (message "Expanded"))
    (inverse-add-global-abbrev 1)))

(defun razzi/paste ()
  (interactive)
  (evil-paste-before 1)
  (right-char))

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

(defun razzi/save-delete-close ()
  (interactive)
  (save-if-buffer-is-file)
  (kill-this-buffer)
  (when (> (length (window-list)) 1)
    (delete-window)))

(defun save-if-buffer-is-file ()
  (if (and buffer-file-name (buffer-modified-p))
    (save-buffer)))

(defun razzi/transpose-next-line ()
  "Switch the current and next lines"
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(defun razzi/transpose-previous-line (arg)
  "Switch the current and previous lines"
  (interactive "P")
  (let ((count (or arg 1))
        (unused))
    (dotimes (number count unused)
      (progn
        (transpose-lines 1)
        (forward-line -2)))))

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
    (forward-line)))

(defun razzi/copy-paragraph ()
  (interactive)
  ;todo go to start of block
  (move-beginning-of-line nil)
  (let ((sentence (thing-at-point 'defun)))
    (insert sentence)
    (insert "\n"))) ; TODO in python make this copy a method _or_ class!

(defun razzi/put-debugger ()
  (interactive)
  (evil-insert-newline-below)
  (indent-for-tab-command)
  (insert "import ipdb; ipdb.set_trace()"))

(defun razzi/restart-emacs ()
  (interactive)
  (save-some-buffers t)
  (mapcar 'delete-process (process-list))
  (restart-emacs))

(defun razzi/kill-line-and-whitespace ()
  (interactive)
  (sp-kill-hybrid-sexp nil)
  (delete-trailing-whitespace))

(defun razzi/change-line ()
  "Make vim C use paredit-kill"
  (interactive)
  (sp-kill-hybrid-sexp nil)
  (evil-insert 0))

(defun razzi/surround-with-single-quotes (start end)
  (interactive "r")
  (evil-surround-region start end nil ?'))

(defun razzi/surround-with-double-quotes (start end)
  (interactive "r")
  (evil-surround-region start end nil ?\"))

(defun razzi/surround-with-parens (start end)
  (interactive "r")
  (evil-surround-region start end nil ?\))
  (goto-char (+ 1 end)))

(defun razzi/surround-with-brackets (start end)
  (interactive "r")
  (evil-surround-region start end nil ?\])
  (goto-char (+ 1 end)))

(defun razzi/edit-init ()
  (interactive)
  (find-file "~/.spacemacs.d/init.el"))

; todo work with url as well
(defun razzi/file-at-point ()
  (interactive)
  (find-file-at-point (ffap-file-at-point)))

(defun razzi/mark-line-text ()
  (interactive)
  (move-end-of-line nil)
  (set-mark-command nil)
  (back-to-indentation))

(defun razzi/almost-end-of-line ()
  (interactive)
  (move-end-of-line 1)
  (backward-char)
  (forward-char))

(defun razzi/almost-end-of-buffer (arg)
  (interactive "P")
  (if (null arg)
    (progn
      (end-of-buffer)
      (previous-line))
    (evil-goto-line arg)))

(defun razzi/replay-q-macro ()
  (interactive)
  (evil-execute-macro 1 "@q"))

(defun razzi/recompile ()
  (interactive)
  (save-buffer)
  (recompile))

(defun razzi/evil-mc-quit-and-quit ()
  (interactive)
  (evil-mc-undo-all-cursors)
  (keyboard-quit))

(defun razzi/copy-test-file-path ()
  (interactive)
  (let* ((root (s-append "/" (s-chomp (shell-command-to-string "git root"))))
         (relative-path (s-chop-prefix root (buffer-file-name)))
         (module (s-replace "/" "." (file-name-sans-extension relative-path))))
    (kill-new module)
    (message "Copied module '%s' to the clipboard." module)))

; todo no macro
(defun razzi/double-quotes-to-single ()
  (interactive)
  (evil-execute-macro 1 "cs\"'"))

(defun razzi/git-push ()
  (interactive)
  (shell-command "git push"))

(defun always-yes (&rest _) t)

(defun no-confirm (fun &rest args)
  "Apply FUN to ARGS, skipping user confirmations."
  (cl-letf (((symbol-function 'y-or-n-p) #'always-yes)
            ((symbol-function 'yes-or-no-p) #'always-yes))
      (apply fun args)))

; move to python
(defun razzi/isort ()
  (interactive)
  (save-buffer)
  (shell-command (format "isort %s" (buffer-file-name)))
  (no-confirm 'revert-buffer t t))

(defun razzi/split-after-comma ()
  (interactive)
  (evil-find-char 1 ?,)
  (evil-forward-char)
  (evil-replace (point) (+ (point) 1) nil ?\n))

(defun razzi/create-scratch-buffer ()
   (interactive)
   (switch-to-buffer (get-buffer-create "*scratch*")))

(defun razzi/put-paren ()
  "fixme no macro"
   (interactive)
   (evil-execute-macro 1 "ox")
   (evil-normal-state)
   (evil-execute-macro 1 "r)<<"))

(defun razzi/next-and-center ()
  (interactive)
  (let ((inhibit-redisplay t))
    (evil-search-next 1)
    (evil-scroll-line-to-center nil)))

(defun razzi/previous-and-center ()
  (interactive)
  (let ((inhibit-redisplay t))
    (evil-search-previous 1)
    (evil-scroll-line-to-center nil)))

(defun razzi/exit-insert-and-save ()
  (interactive)
  (evil-normal-state)
  (save-buffer))

(defun prelude-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun razzi/copy-file-name ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (file-name-nondirectory (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun razzi/split-alternate-buffer ()
  (interactive)
  (split-window-right)
  (spacemacs/alternate-buffer))

(defun razzi/exit-insert ()
  (interactive)
  (expand-abbrev)
  (evil-normal-state))

(defun razzi/open-sexp ()
  (interactive)
  (evil-first-non-blank)
  (sp-forward-sexp)
  (newline-and-indent)
  (evil-insert-state))

(defun razzi/open-sexp-eol ()
  (interactive)
  (evil-end-of-line)
  (newline-and-indent)
  (evil-insert-state))

(defun razzi/python-format ()
  (interactive)
  (shell-command (format "python_format.sh %s" (buffer-file-name)))
  (revert-buffer nil t))

(defun razzi/switch-to-other-buffer ()
  (interactive)
  (switch-to-buffer (cadr (buffer-list))))

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun dotspacemacs/user-config ()

  (setq
   display-time-default-load-average nil
   tags-add-tables t
   cider-allow-jack-in-without-project t

   recentf-exclude '("TAGS")
   evil-cross-lines t
   evil-ex-substitute-global t
   evil-insert-state-cursor 'bar
   evil-regexp-search nil
   evilmi-always-simple-jump t
   ns-pop-up-frames nil

   clojure-indent-style :always-indent

   abbrev-file-name "~/.spacemacs.d/abbrev_defs.el"
   frame-title-format "%f"

   save-abbrevs 'silently
   confirm-nonexistent-file-or-buffer nil
   kill-buffer-query-functions
     (delq 'process-kill-buffer-query-function kill-buffer-query-functions)

   powerline-default-separator 'nil
   vc-follow-symlinks t

   mc/always-run-for-all t
   web-mode-markup-indent-offset 2
   mac-option-modifier 'super
   mac-command-modifier 'meta)

  (abbrev-mode)
  (display-time-mode)
  (super-save-mode)

  (global-auto-revert-mode 1)
  (global-evil-mc-mode 1)
  (global-subword-mode)
  (menu-bar-mode -1)

  (spaceline-toggle-buffer-encoding-abbrev-off)
  (spaceline-toggle-buffer-size-off)
  (spaceline-toggle-major-mode-off)
  (spaceline-toggle-minor-modes-off)

  (set-face-foreground 'font-lock-comment-face "dark grey")
  (set-face-foreground 'font-lock-doc-face "teal")
  (set-face-background 'magit-diff-context-highlight "light cyan")
  (set-face-background 'magit-diff-hunk-heading-highlight "gray60")
  (set-face-background 'hl-line "#f3f9ff")

  (evil-leader/set-key
    "," 'razzi/append-comma
    "\\" 'multi-term
    "[" 'evil-open-above
    ")" 'razzi/put-paren
    "." 'razzi/copy-paragraph
    "-" 'razzi/save-delete-close
    "DEL" 'razzi/restart-emacs
    "TAB" 'spacemacs/alternate-buffer
    "SPC" 'helm-M-x
    "ESC" 'kill-this-buffer
    "RET" 'razzi/split-after-comma
    "<backtab>" 'razzi/split-alternate-buffer
    "c r" 'razzi/recompile
    "f i" 'razzi/edit-init
    "f RET" 'razzi/copy-file-name
    "f p" 'razzi/copy-test-file-path
    "f SPC" 'copy-file-name-to-clipboard
    "h f" 'describe-function
    "h v" 'describe-variable
    "g g" 'magit-checkout
    "g p" 'razzi/git-push
    "i c" 'razzi/copy-paragraph
    "i d" 'razzi/put-debugger
    "i s" 'razzi/isort
    "o" 'razzi/put-after
    "O" 'razzi/put-before
    "'" 'razzi/double-quotes-to-single
    "C-o" 'razzi/put-before
    "C-SPC" 'spacemacs//workspaces-eyebrowse-next-window-config-n
    "=" 'razzi/python-format
    "v" 'razzi/voice)

  (mapc 'evil-declare-not-repeat '(razzi/next-and-center razzi/previous-and-center))

  (global-set-key (kbd "C-`") 'describe-key)

  (evil-set-initial-state 'term-mode 'insert)

  (add-to-list 'auto-mode-alist '("\\.rest$" . restclient-mode))
  (add-to-list 'auto-mode-alist '("\\.js$" . web-mode))

  (general-define-key :states 'insert
   "<escape>" 'razzi/exit-insert
   "C-c a" 'razzi/abbrev-or-add-global-abbrev
   "C-h" 'sp-backward-delete-char
   "C-l" 'sp-slurp-hybrid-sexp
   "C-t" 'razzi/transpose-previous-chars
   "<tab>" 'yas-expand
   "M-RET" 'razzi/recompile
   "M-l" 'sp-forward-sexp
   "M-s" 'razzi/exit-insert-and-save
   "M-v" 'razzi/paste)

  (general-define-key :states 'normal
   "-" 'razzi/transpose-next-line
   "0" 'evil-first-non-blank
   "<backtab>" 'previous-buffer
   "C" 'razzi/change-line
   "C-SPC" 'spacemacs/workspaces-micro-state
   "C-a" 'evil-numbers/inc-at-pt
   "C-g" 'razzi/evil-mc-quit-and-quit
   "C-h" 'evil-window-left
   "C-l" 'evil-window-right
   "C-p" 'evil-paste-after
   "C-x" 'evil-numbers/dec-at-pt
   "D" 'razzi/kill-line-and-whitespace
   "E" 'forward-symbol
   "G" 'razzi/almost-end-of-buffer
   "K" 'evil-previous-line ; typo this one all the time
   "M-/" 'evilnc-comment-or-uncomment-lines
   "M-RET" 'razzi/recompile
   "M-`" 'other-window
   "M-d" 'evil-mc-make-and-goto-next-match
   "M-r" 'sp-raise-sexp
   "M-s" 'save-buffer
   "M--" 'spacemacs/scale-down-font
   "M-=" 'spacemacs/scale-up-font
   "M-w" 'kill-this-buffer
   "N" 'razzi/previous-and-center
   "Q" 'razzi/replay-q-macro
   ;; "TAB" 'spacemacs/alternate-buffer
   "[ SPC" 'razzi/insert-newline-before
   "[ c" 'git-gutter:previous-hunk
   "] SPC" 'razzi/insert-newline-after
   "] c" 'git-gutter:next-hunk
   "^" 'evil-digit-argument-or-evil-beginning-of-line
   "_" 'razzi/transpose-previous-line
   ; todo visual c buggy now, and committing broken
   "c" (general-key-dispatch 'evil-change "ru" 'string-inflection-camelcase)
   "g/" 'spacemacs/helm-project-smart-do-search-region-or-symbol
   "g[" 'helm-etags-select
   "g]" 'evil-jump-to-tag
   "gf" 'razzi/file-at-point
   "n" 'razzi/next-and-center
   "s-d" 'evil-mc-make-and-goto-next-match
   "s-x" 'helm-M-x)

  (general-define-key :states 'visual
    "!" 'sort-lines
    "$" 'razzi/almost-end-of-line
    "'" 'razzi/surround-with-single-quotes
    ")" 'razzi/surround-with-parens
    "\"" 'razzi/surround-with-double-quotes
    "]" 'razzi/surround-with-brackets
    "E" 'forward-symbol
    "c" 'evil-change
    "ae" 'mark-whole-buffer
    "il" 'razzi/mark-line-text
    "M-d" 'mc/mark-next-symbol-like-this)

  (evil-define-text-object whole-buffer (count &optional beginning end type)
    (evil-range 0 (point-max)))

  (general-define-key :states 'operator
    "E" 'forward-symbol
    "ae" 'whole-buffer
    "SPC" 'evil-inner-symbol)

  (define-key minibuffer-local-map (kbd "C-j") 'exit-minibuffer)

  (define-key term-mode-map (kbd "<tab>") 'self-insert-command)

  ;todo move to own layers

  (company-tng-configure-default)

  (use-package flycheck-mypy)
  (use-package pyenv-mode)

  (pyenv-mode)
  (pyenv-mode-set "3.6.0")
  (setq python-shell-interpreter "python3.6")
  (setq-default flycheck-disabled-checkers '(python-pylint python-pycompile))

  (add-hook 'evil-insert-state-exit-hook 'expand-abbrev)
  (add-hook 'focus-out-hook 'garbage-collect)
  (add-hook 'term-mode-hook 'turn-off-evil-mode)

  ; is this interfering with clojure c-p?
  (evil-define-key 'insert cider-mode-map (kbd "C-p") 'cider-repl-backward-input)

  (evil-define-key 'normal cider-mode-map
    (kbd "C") 'razzi/change-line)

  ; todo move to clojure config
  (evil-define-key 'normal clojure-mode-map
    (kbd "C") 'razzi/change-line)

  (evil-define-key 'normal clojure-mode-map (kbd "M-j") 'razzi/open-sexp)
  (evil-define-key 'normal clojure-mode-map (kbd "RET") 'razzi/open-sexp-eol)
  (evil-define-key 'normal clojure-mode-map (kbd "M-s") 'save-buffer)

  (defun razzi/make-parent-directories (filename)
    "Create parent directory if not exists while visiting file."
    (unless (file-exists-p filename)
      (let ((dir (file-name-directory filename)))
        (unless (file-exists-p dir)
          (make-directory dir)))))

  (advice-add 'find-file :before 'razzi/make-parent-directories)

  (defun razzi/replace-control-g-with-nil (char)
    "Make C-g read as nil so that `r C-g` cancels the replace."
    (let ((control-g-char ?\a))
      (if (eq char control-g-char)
          (progn
            (message "Quit")  ; Without calling message, the cursor stays looking like replace
            nil)              ; Returning nil cancels the replace
        char)))

  (advice-add 'evil-read-key :filter-return 'razzi/replace-control-g-with-nil)

  (advice-add 'spacemacs/check-large-file :around 'no-confirm))


; complain function which will put the string as a comment in a relevant config per mode
; todo use parinfer
; when yyp copy 2 lines, keep cursor on same character
