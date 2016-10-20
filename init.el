(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   dotspacemacs-configuration-layers
   '(
     lua
     erc
     csv
     sql
     shell-scripts
     clojure
     deft
     elm
     emacs-lisp
     eyebrowse
     git
     go
     html
     markdown
     osx
     python
     yaml

     ;; (python
     ;;  :variables
      ;; python-enable-yapf-format-on-save t)

     ; (coerce :location local)
     razzishell
     razzilisp
     razziundohist
     razzineotree

     (razzicompletion
        :variables auto-completion-enable-snippets-in-popup t)
     javascript
     term
     ;; version-control
     ;rename to razzivc
     vc
     osx

     ;; tl

     ;; org
     ;; spell-checking
     (syntax-checking :variables syntax-checking-enable-tooltips nil)
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(multiple-cursors restclient flycheck-mypy virtualenvwrapper)
   dotspacemacs-excluded-packages '(anaconda-mode evil-escape eldoc)
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
   dotspacemacs-themes '(
                         leuven
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
   dotspacemacs-auto-resume-layouts t
   dotspacemacs-auto-save-file-location nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   dotspacemacs-enable-paste-micro-state t
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
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   ;todo turn this off and replace with git hook(s)
   dotspacemacs-whitespace-cleanup 'nil
   ))

(defun dotspacemacs/user-init ()
  "This function is mostly useful for variables that need to be set
before packages are loaded."
  (setq
   helm-mode-fuzzy-match t
   helm-M-x-fuzzy-match t))

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
  (let (
        (count (or arg 1))
        (unused)
        )
    (dotimes (number count unused) (
      progn
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

(defun razzi/isearch-transpose-char ()
  (interactive)
  (when (> (length isearch-string) 1)
    (let* ((string isearch-string)
           (len (length isearch-string))
           (second-to-last-char (aref string (- len 2)))
           (last-char (aref string (- len 1))))
      (isearch-pop-state)
      (isearch-pop-state)
      (isearch-process-search-char last-char)
      (isearch-process-search-char second-to-last-char))))

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
  ; TODO could run @q directly rather than executing those chars as a command
  (evil-execute-macro 1 "@q"))

(defun razzi/recompile ()
  (interactive)
  (save-buffer)
  (recompile))

(defun razzi/file-at-point ()
  (interactive)
  (find-file-at-point (thing-at-point 'url)))

(defun razzi/evil-mc-quit-and-quit ()
  (interactive)
  (evil-mc-undo-all-cursors)
  (keyboard-quit))

(defun razzi/copy-test-file-path ()
  (interactive)
  (let* (
         (root (s-append "/" (s-chomp (shell-command-to-string "git root"))))
         (relative-path (s-chop-prefix root (buffer-file-name)))
         (module (s-replace "/" "." (file-name-sans-extension relative-path)))
         )
    (kill-new module)
    (message "Copied module '%s' to the clipboard." module)
    )
  )

; todo
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
   "create a scratch buffer"
   (interactive)
   (switch-to-buffer (get-buffer-create "*scratch*")))

(defun razzi/put-paren ()
  "fixme no macro"
   (interactive)
   (evil-execute-macro 1 "ox")
   (evil-normal-state)
   (evil-execute-macro 1 "r)<<"))

(defun razzi/next-and-center ()
  ; TODO only if off-screen
  (interactive)
  (let ((inhibit-redisplay t))
    (evil-search-next 1)
    (evil-scroll-line-to-center nil)))

(defun razzi/previous-and-center ()
  (interactive)
  (let ((inhibit-redisplay t))
    (evil-search-previous 1)
    (evil-scroll-line-to-center nil)))

(defun prelude-copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun razzi/split-alternate-buffer ()
  (interactive)
  (split-window-right)
  (spacemacs/alternate-buffer))

; TODO refactor
(defun razzi/star-isearch ()
  (interactive)
  (while (not (looking-at "[A-z]"))
      (forward-char))

  (let ((inhibit-redisplay 1)
        (selection (evil-visual-state-p))
        (visual-type (evil-visual-type))
        (text (if (use-region-p)
                (buffer-substring-no-properties (region-beginning) (region-end))
                (thing-at-point 'symbol))))
    ; Go to the start of the word if not in visual and not already at the start
    (when (and (not selection)
               (not (looking-at "\\_<")))
      (backward-sexp))
    (evil-exit-visual-state)
    (isearch-mode t)
    (isearch-yank-string text)
    (isearch-done)
    (evil-search-next)
    (when (and
            selection
            (not (eq visual-type 'line)))
      (evil-search-previous))))

(defun razzi/pound-isearch ()
  (interactive)
  (while (not (looking-at "[A-z]"))
      (backward-char))
  (let ((inhibit-redisplay 1)
        (selection (evil-visual-state-p))
        (visual-type (evil-visual-type))
        (text (if (use-region-p)
                (buffer-substring-no-properties (region-beginning) (region-end))
                (thing-at-point 'symbol))))
    (when (and (not selection)
               (not (looking-at "\\_<")))
      (progn
        (backward-sexp)
        (if (eq ?' (char-before (point)))
            (forward-char))))
    (save-excursion
      (isearch-mode nil)
      (message text)
      (isearch-yank-string text)
      (isearch-done))
    (evil-search-next)
    (when (and
            selection
            (not (eq visual-type 'line)))
      (evil-search-previous))))

(defun razzi/coerce-uppercase (&optional start end)
  (interactive "r")
  ; if no selection, select current word
  ;https://www.emacswiki.org/emacs/MarkCommands
  (let (
        (text (if (use-region-p)
                  (buffer-substring-no-properties start end)
                (thing-at-point 'symbol)))
        )
  ))

(defun dotspacemacs/user-config ()

  (setq display-time-default-load-average nil)
  (display-time-mode)
  (spaceline-toggle-buffer-modified-off)
  (spaceline-toggle-buffer-size-off)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-major-mode-off)
  (spaceline-toggle-buffer-encoding-abbrev-off)
  (global-evil-mc-mode 1)

  ;; (when (get-buffer "*scratch*")
  ;;   (kill-buffer "*scratch*"))

  ;; (set-face-background 'hl-line "black")
  (set-face-foreground 'font-lock-comment-face "dark grey")
  (set-face-foreground 'font-lock-doc-face "teal")
  (set-face-background 'magit-diff-context-highlight "light cyan")
  (set-face-background 'magit-diff-hunk-heading-highlight "gray60")
  ;; (set-face-background 'hl-line "#d3e9ff")
  (evil-leader/set-key
    "," 'razzi/append-comma
    "[" 'evil-open-above
    ")" 'razzi/put-paren
    "." 'razzi/copy-paragraph
    "-" 'razzi/save-delete-close
    "DEL" 'razzi/restart-emacs
    "SPC" 'helm-M-x
    "ESC" 'kill-this-buffer
    "RET" 'razzi/split-after-comma
    "RET" 'razzi/switch-to-term-buffer
    "<backtab>" 'razzi/split-alternate-buffer
    "c r" 'razzi/recompile
    "f i" 'razzi/edit-init
    "f SPC" 'prelude-copy-file-name-to-clipboard
    "f p" 'razzi/copy-test-file-path
    "h f" 'describe-function
    "h v" 'describe-variable
    "g g" 'magit-checkout
    "g f" 'razzi/file-at-point
    "g p" 'razzi/git-push
    "i c" 'razzi/copy-paragraph
    "i d" 'razzi/put-debugger
    "i s" 'razzi/isort
    ;; "g g" 'helm-projectile-ag
    ;; "g f" 'razzi/file-at-point
    "o" 'razzi/put-after
    "O" 'razzi/put-before
    "r" 'helm-recentf
    "'" 'razzi/double-quotes-to-single
    "C-o" 'razzi/put-before
    "C-SPC" 'spacemacs//workspaces-eyebrowse-next-window-config-n
    ;; "o d" 'razzi/put-debugger
    "v" 'razzi/select-symbol)

  (evil-set-initial-state 'term-mode 'insert)
  ; TODO make scratch markdown or something so that it starts in normal mode
  (evil-set-initial-state 'text-mode 'insert)

  (mapc 'evil-declare-not-repeat '(razzi/next-and-center razzi/previous-and-center))

  (setq
    ns-pop-up-frames nil
    evil-regexp-search nil
    evil-cross-lines t
    evil-ex-substitute-global t
    custom-file "~/.emacs.d/custom.el"

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
    mac-command-modifier 'meta
    )

  (load custom-file 'noerror)

  (setq-default
    abbrev-mode t
    ;todo doesn't take effect
    scroll-margin 0)

  ; Todo make this work with console emacs
  (global-set-key (kbd "C-`") 'describe-key)
  (if (display-graphic-p)
      (enable-theme 'leuven)
    (enable-theme 'spacemacs-dark))

  (setq auto-mode-alist (cons '("\\.rest$" . restclient-mode) auto-mode-alist))

  ; need to put this somewhere else
  (define-key evil-insert-state-map (kbd "C-c a") 'razzi/abbrev-or-add-global-abbrev)
  (define-key evil-insert-state-map (kbd "C-h") 'sp-backward-delete-char)
  (define-key evil-insert-state-map (kbd "C-l") 'sp-slurp-hybrid-sexp)
  (define-key evil-insert-state-map (kbd "M-v") 'razzi/paste)
  ;; (define-key evil-insert-state-map (kbd "C-p") nil)
  (define-key evil-insert-state-map (kbd "C-t") 'razzi/transpose-previous-chars)
  (define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)

  (define-key evil-normal-state-map (kbd "-") 'razzi/transpose-next-line)
  (define-key evil-normal-state-map (kbd "0") 'evil-first-non-blank)
  ; TODO skip tags buffer :[
  (define-key evil-normal-state-map (kbd "<backtab>") 'previous-buffer)
  (define-key evil-normal-state-map (kbd "C") 'razzi/change-line)
  (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-p") 'evil-paste-after)
  (define-key evil-normal-state-map (kbd "C-g") 'razzi/evil-mc-quit-and-quit)
  (define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)
  (define-key evil-normal-state-map (kbd "C-SPC") 'spacemacs/workspaces-micro-state)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  (define-key evil-normal-state-map (kbd "C-p") 'evil-paste-after)
  (define-key evil-normal-state-map (kbd "D") 'razzi/kill-line-and-whitespace)
  (define-key evil-normal-state-map (kbd "G") 'razzi/almost-end-of-buffer)
  (define-key evil-normal-state-map (kbd "M-`") 'other-window)
  (define-key evil-normal-state-map (kbd "M-d") 'evil-mc-make-and-goto-next-match)
  (define-key evil-normal-state-map (kbd "E") 'forward-symbol)
  (define-key evil-normal-state-map (kbd "Q") 'razzi/replay-q-macro)
  (define-key evil-normal-state-map (kbd "TAB") 'spacemacs/alternate-buffer)
  (define-key evil-normal-state-map (kbd "[ SPC") 'razzi/insert-newline-before)
  (define-key evil-normal-state-map (kbd "[ c") 'git-gutter:previous-hunk)
  (define-key evil-normal-state-map (kbd "] SPC") 'razzi/insert-newline-after)
  (define-key evil-normal-state-map (kbd "] c") 'git-gutter:next-hunk)
  (define-key evil-normal-state-map (kbd "^") 'evil-digit-argument-or-evil-beginning-of-line)
  (define-key evil-normal-state-map (kbd "g/") 'spacemacs/helm-project-smart-do-search-region-or-symbol)
  (define-key evil-normal-state-map (kbd "g]") 'evil-jump-to-tag)
  (define-key evil-normal-state-map (kbd "g[") 'helm-etags-select)
  (define-key evil-normal-state-map (kbd "n") 'razzi/next-and-center)
  (define-key evil-normal-state-map (kbd "N") 'razzi/previous-and-center)
  ;; (define-key evil-normal-state-map (kbd "RET") 'delete-other-windows)
  (define-key evil-normal-state-map (kbd "*") 'razzi/star-isearch)
  (define-key evil-normal-state-map (kbd "#") 'razzi/pound-isearch)
  (define-key evil-normal-state-map (kbd "gf") 'razzi/file-at-point)
  (define-key evil-normal-state-map (kbd "_") 'razzi/transpose-previous-line)
  (define-key evil-normal-state-map (kbd "s-d") 'evil-mc-make-and-goto-next-match)
  (define-key evil-normal-state-map (kbd "s-x") 'helm-M-x)

  (define-key evil-visual-state-map (kbd "!") 'sort-lines)
  (define-key evil-visual-state-map (kbd "$") 'razzi/almost-end-of-line)
  (define-key evil-visual-state-map (kbd "'") 'razzi/surround-with-single-quotes)
  (define-key evil-visual-state-map (kbd ")") 'razzi/surround-with-parens)
  (define-key evil-visual-state-map (kbd "\"") 'razzi/surround-with-double-quotes)
  (define-key evil-visual-state-map (kbd "]") 'razzi/surround-with-brackets)
  (define-key evil-visual-state-map (kbd "E") 'forward-symbol)
  (define-key evil-visual-state-map (kbd "ae") 'mark-whole-buffer)
  (define-key evil-visual-state-map (kbd "il") 'razzi/mark-line-text)
  (define-key evil-visual-state-map (kbd "M-d") 'mc/mark-next-symbol-like-this)

  (define-key evil-operator-state-map (kbd "SPC") 'evil-inner-symbol)
  (define-key evil-operator-state-map (kbd "E") 'forward-symbol)
  (define-key evil-operator-state-map (kbd "ru") 'razzi/coerce-uppercase)

  (define-key minibuffer-local-map (kbd "C-j") 'exit-minibuffer)

  (define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
  (define-key isearch-mode-map (kbd "C-j") 'isearch-done)
  (define-key isearch-mode-map (kbd "C-t") 'razzi/isearch-transpose-char)
  (define-key isearch-mode-map (kbd "M-v") 'isearch-yank-pop)

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
    (evil-define-key 'normal dired-mode-map (kbd "gs") 'magit-status)
    ;(dired-hide-details-mode)
    )

  ;; (add-hook 'evil-insert-state-exit-hook 'save-if-buffer-is-file)
  (add-hook 'evil-insert-state-exit-hook 'expand-abbrev)
  (add-hook 'focus-out-hook 'save-if-buffer-is-file)
  (add-hook 'focus-out-hook 'garbage-collect)
  (add-hook 'focus-out-hook 'evil-normal-state)

  (setq recentf-exclude '("TAGS"))

  (defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
    "Create parent directory if not exists while visiting file."
    (unless (file-exists-p filename)
      (let ((dir (file-name-directory filename)))
        (unless (file-exists-p dir)
          (make-directory dir)))))

  (defadvice spacemacs/check-large-file (around open-ctags-literally activate)
    (flet ((y-or-n-p (&rest args) t))
      ad-do-it))

  (ad-activate 'find-file)
  (global-auto-revert-mode 1)
  (menu-bar-mode -1)

  ;; (run-with-idle-timer 1 t 'save-if-buffer-is-file)
  )
; complain function which will put the string as a comment in a relevant config per mode
; command to turn [x] into [\n    x\n]
;search current word
;; company repeat
;VV
; todo use parinfer
; todo do these work?
(setq comint-move-point-for-output nil)
(setq comint-scroll-show-maximum-output nil)
