(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   dotspacemacs-configuration-layers
   '(csv
     auto-completion
     clojure
     ;; csv
     emacs-lisp
     lsp
     ;; fsharp
     git
     ;; go
     ;; haskell
     html
     javascript
     ;; lua
     markdown
     osx
     (python :variables python-backend 'lsp)
     ;; TODO get rid of lsp :()
     ;; razzipython
     ;; ruby
     ;; rust
     shell-scripts
     sql
     ;; swift
     typescript
     yaml

     shell
     razzi-shell
     ;; razzishell

     razzi-clojure
     razzi-dired
     razzi-helm
     razzi-isearch
     razzi-javascript
     razzi-projectile
     razzi-python
     razzi-tab-completion
     razzi-vc
     ;; razzi-voice
     razzi-dumb-jump
     ; razzilisp
     razzi-restclient
     razzineotree
     razzicompletion

     term
     ;; ivy someday

     ;; org
     (syntax-checking :variables syntax-checking-enable-tooltips nil))
   dotspacemacs-excluded-packages '(anaconda-mode company-anaconda evil-escape eldoc archive-mode lsp-ui auto-highlight-symbol)
   dotspacemacs-additional-packages '(super-save
                                      cherry-blossom-theme
                                      load-theme-buffer-local
                                      pytest
                                      buffer-move
                                      monroe
                                      evil-terminal-cursor-changer
                                      evil-multiedit
                                      flycheck-mypy
                                      multiple-cursors
                                      pyenv-mode
                                      string-inflection
                                      virtualenvwrapper
                                      apib-mode
                                      general)
   dotspacemacs-delete-orphan-packages nil))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-enable-lazy-installation nil ; as long as I have a patched python layer
   dotspacemacs-verbose-loading t
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
   dotspacemacs-mode-line-theme 'spacemacs
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-smartparens-strict-mode t
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
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
  (setq custom-file "~/.emacs.d/custom.el"
        helm-mode-fuzzy-match t
        helm-ff-newfile-prompt-p nil
        helm-M-x-fuzzy-match t
        ;; exec-path-from-shell-check-startup-files nil
        )
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

(defun razzi/close-all-file-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun razzi/put-after ()
  (interactive)
  (evil-with-single-undo
    (evil-insert-newline-below)
    (indent-for-tab-command)
    (insert (s-trim (current-kill 0)))
    (forward-line)))

(defun razzi/get-current-paragraph ()
  "hacky af"
  (interactive)
  (save-excursion
    (evil-execute-macro 1 "vap")
    (let ((text (buffer-substring-no-properties (region-beginning) (region-end))))
      (evil-execute-macro 1 "vv")
      text)))

(defun razzi/copy-paragraph ()
  (interactive)
  (move-beginning-of-line nil)
  (let ((sentence (razzi/get-current-paragraph)))
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

(defun razzi/surround-with-backticks (start end)
  (interactive "r")
  (evil-surround-region start end nil ?`))

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
  (find-file-at-point (thing-at-point 'filename t)))

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
  (let ((inhibit-message t))
    (if (null arg)
        (progn
          (end-of-buffer)
          (previous-line))
      (evil-goto-line arg))))

(defun razzi/replay-q-macro ()
  (interactive)
  (evil-execute-macro 1 "@q"))

(defun razzi/recompile ()
  (interactive)
  (save-buffer)
  (recompile))

(defun razzi/evil-mc-quit-and-quit ()
  (interactive)
  (when (and (boundp 'iedit-mode) iedit-mode) (iedit-mode))
  (evil-mc-undo-all-cursors)
  (keyboard-quit))

(defun razzi/copy-test-file-path ()
  (interactive)
  (let* ((root (s-append "/" (s-chomp (shell-command-to-string "git root"))))
         (relative-path (s-chop-prefix root (buffer-file-name)))
         (module (s-replace "/" "." (file-name-sans-extension relative-path))))
    (kill-new module)
    (message "Copied module '%s' to the clipboard." module)))

; todo refactor with above
(defun razzi/copy-project-file-path ()
  (interactive)
  (let* ((root (s-append "/" (s-chomp (shell-command-to-string "git root"))))
         (relative-path (s-chop-prefix root (buffer-file-name))))
    (kill-new relative-path)
    (message "Copied path '%s' to the clipboard." relative-path)))

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

(defun razzi/run-script-on-file (command)
  (save-buffer)
  (shell-command (concat command " " (buffer-file-name)))
  (no-confirm 'revert-buffer t t))

; TODO move to python
; TODO fails silently
(defun razzi/isort ()
  (interactive)
  (razzi/run-script-on-file "isort"))

(defun razzi/importmagic ()
  (interactive)
  (razzi/run-script-on-file "importmagic"))

(defun razzi/prettier ()
  (interactive)
  (razzi/run-script-on-file "prettier --write"))

(defun razzi/gray ()
  (interactive)
  (razzi/run-script-on-file "gray"))

(defun razzi/split-after-comma ()
  (interactive)
  (evil-find-char 1 ?,)
  (evil-forward-char)
  (if (eq (following-char) ?\s)
      (evil-replace (point) (+ (point) 1) nil ?\n)
    (progn
      (insert ?\n)
      (indent-for-tab-command))))

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

(defun razzi/copy-file-dir ()
  "Copy the current buffer directory to the clipboard."
  (interactive)
  (kill-new default-directory)
  (message "Copied buffer directory '%s' to the clipboard." default-directory))

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

(defun razzi/search-paste ()
  (interactive)
  (spacemacs/helm-project-smart-do-search)
  ; how to yank into helm?
  (yank))

(defun razzi/monroe ()
  (interactive)
  (monroe "localhost:7888"))

(defun copy-region-to-other-window (start end)
  "Move selected text to other window"
  (interactive "r")
  (if (use-region-p)
      (save-excursion
        (kill-ring-save start end)
        (other-window 1)
        (yank)
        (newline))
    (message "No region selected")))

(defun razzi/hackro ()
  "Other window, go to bottom and into insert mode"
  (interactive)
  (other-window 1)
  (evil-execute-macro 1 "GA"))

(defun razzi/associate-extension-mode (extension mode)
  (let ((pattern (s-concat "\\." extension "$")))
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(defun razzi/switch-to-other-buffer ()
  (interactive)
  (switch-to-buffer (cadr (buffer-list))))

(defun razzi/match-and-next ()
  (interactive)
  (evil-multiedit-match-symbol-and-next)
  (evil-multiedit-match-symbol-and-next))

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun razzi/yas-expand()
  (interactive)
  (yas-expand)
  (if (eq (following-char) ?\s)
      (delete-char 1)))

(defun razzi/surround-paragraph()
  (interactive)
  ; blerg
  (evil-execute-macro 1 "ysil<p"))
  ;; (evil-visual-char)
  ;; (evil-end-of-line)
  ;; (evil-surround-region (region-beginning) (1+ (region-end)) 'line ?<)
  ;; ;; (self-insert-command "p")
  ;; (exit-minibuffer))

(defun razzi/surround-div()
  (interactive)
  ; blerg
  (evil-execute-macro 1 "ysil<div"))

; todo clojure style (defmacro let)
;; (let [filename 1] (message filename))

; vaguely better than copying and pasting manually
(defun razzi/send-region-to-tmux (start end)
  (interactive "r")
  (setq tmux-fd "/dev/ttys001") ; todo hardcoded
  (shell-command (s-concat "sudo writevt " tmux-fd " \"" (buffer-substring start end) "\"")))

(defun razzi/search-project-whole-word ()
  (interactive)
  ;todo
  (evil-execute-macro 1 "g/")
  (sleep-for 0 500)
  (evil-execute-macro 1 "\b"))

(defun razzi/swap-commented-out ()
  (interactive)
  (evilnc-comment-or-uncomment-lines 1)
  (evil-next-line)
  (evilnc-comment-or-uncomment-lines 1))

(defun dotspacemacs/user-config ()
  (setq
   shell-file-name "/bin/bash"
   flycheck-python-flake8-executable "flake8"
   display-time-default-load-average nil
   tags-add-tables t
   cider-allow-jack-in-without-project t

   recentf-exclude '("TAGS")
   create-lockfiles nil
   evil-cross-lines t
   evil-ex-substitute-global t
   evil-insert-state-cursor 'bar
   evil-regexp-search nil
   evilmi-always-simple-jump t
   ns-pop-up-frames nil
   hl-todo-keyword-faces nil

   clojure-indent-style :always-indent
   js2-strict-missing-semi-warning nil
   python-indent-guess-indent-offset nil

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
  (spaceline-toggle-minor-modes-off)

  (set-face-foreground 'font-lock-comment-face "dark grey")
  (set-face-foreground 'font-lock-doc-face "teal")
  (set-face-background 'magit-diff-context-highlight "light cyan")
  (set-face-background 'magit-diff-hunk-heading-highlight "gray60")
  ;; (set-face-background 'hl-line "#f3f9ff")

  (evil-leader/set-key
    ;; "'" 'razzi/double-quotes-to-single
    ")" 'razzi/put-paren ; this is janky but useful
    "," 'razzi/append-comma ; only makes sense for python-like
    "-" 'razzi/save-delete-close
    "." 'razzi/copy-paragraph ; unused
    "<backtab>" 'razzi/split-alternate-buffer
    "C-o" 'razzi/put-before
    "DEL" 'razzi/restart-emacs
    "ESC" 'kill-this-buffer
    "O" 'razzi/put-before
    "RET" 'razzi/split-after-comma
    "SPC" 'helm-M-x
    "TAB" 'spacemacs/alternate-buffer
    "[" 'evil-open-above
    "\\" 'multi-term
    "]" '(lambda () (interactive) (evil-execute-macro 1 "ysiW]"))
    "c r" 'razzi/recompile
    "e n" 'flycheck-next-error
    "e p" 'flycheck-previous-error
    "f SPC" 'copy-file-name-to-clipboard
    "f i" 'razzi/edit-init
    "f n" 'razzi/copy-file-name
    "f d" 'razzi/copy-file-dir
    "f p" 'razzi/copy-test-file-path
    "f RET" 'razzi/copy-project-file-path
    "g g" 'magit-checkout
    "g p" 'razzi/git-push
    "h f" 'describe-function
    "h v" 'describe-variable
    "i c" 'razzi/copy-paragraph
    "i d" 'razzi/put-debugger
    "i m" 'razzi/importmagic
    "i p" 'razzi/prettier
    "i e" 'iedit-mode
    "i s" 'razzi/isort
    "i g" 'razzi/gray
    "i b" 'blacken-buffer
    "o" 'razzi/put-after
    "C-SPC" 'spacemacs//workspaces-eyebrowse-next-window-config-n
    "q b" 'razzi/close-all-file-buffers
    "q r" 'razzi/restart-emacs
    "t SPC" 'spacemacs/toggle-debug-on-error
    "v" 'razzi/search-paste
    "=" 'razzi/python-format)

  (mapc 'evil-declare-not-repeat '(razzi/next-and-center razzi/previous-and-center))

  (global-set-key (kbd "C-`") 'describe-key)

  (evil-set-initial-state 'term-mode 'insert)

  (general-define-key :states 'insert
   "<escape>" 'razzi/exit-insert
   "C-c a" 'razzi/abbrev-or-add-global-abbrev
   "C-h" 'sp-backward-delete-char
   "C-l" 'sp-slurp-hybrid-sexp
   "C-t" 'razzi/transpose-previous-chars
   "<tab>" 'razzi/yas-expand
   "M-RET" 'lisp-state-eval-sexp-end-of-line
   "s-<backspace>" 'evil-delete-backward-word
   "M-l" 'sp-forward-sexp
   "M-s" 'razzi/exit-insert-and-save
   "M-v" 'razzi/paste)

  (general-define-key :states 'normal
   "-" 'razzi/transpose-next-line
   "0" 'evil-first-non-blank
   "<backtab>" 'previous-buffer
   "C" 'razzi/change-line
   "C-SPC j" 'evil-window-down
   "C-SPC k" 'evil-window-up
   "C-a" 'evil-numbers/inc-at-pt
   "C-g" 'razzi/evil-mc-quit-and-quit
   "C-h" 'evil-window-left
   "C-l" 'evil-window-right
   "C-p" 'evil-paste-after
   "C-x" 'evil-numbers/dec-at-pt
   "C-;" 'evil-ex-nohighlight
   "D" 'razzi/kill-line-and-whitespace
   "E" 'forward-symbol
   "G" 'razzi/almost-end-of-buffer
   "K" 'evil-previous-line ; typo this one all the time
   "M-a" 'mark-whole-buffer
   "M-c" 'evil-yank-line
   "M--" 'spacemacs/scale-down-font
   "M-0" 'spacemacs/reset-font-size
   "M-/" 'evilnc-comment-or-uncomment-lines
   "M-?" 'razzi/swap-commented-out
   "M-l" 'evil-visual-line
   "M-=" 'spacemacs/scale-up-font
   "M-RET" 'lisp-state-eval-sexp-end-of-line
   "M-`" 'other-window
   "M-d" 'evil-mc-make-and-goto-next-match
   "M-r" 'sp-raise-sexp
   "M-n" 'razzi/match-and-next
   "M-[" 'flycheck-previous-error
   "M-]" 'flycheck-next-error
   "M-s" 'save-buffer
   "M-f" 'evil-ex-search-forward
   "M-w" 'kill-this-buffer
   "N" 'evil-search-previous
   "Q" 'razzi/replay-q-macro
   "/" 'evil-search-forward
   "[ SPC" 'razzi/insert-newline-before
   "[ c" 'git-gutter:previous-hunk
   "] SPC" 'razzi/insert-newline-after
   "] c" 'git-gutter:next-hunk
   "^" 'evil-digit-argument-or-evil-beginning-of-line
   "_" 'razzi/transpose-previous-line
   ; todo visual c buggy now
   "c" (general-key-dispatch 'evil-change
         "ru" 'string-inflection-upcase
         "rs" 'string-inflection-underscore
         "rt" 'string-inflection-camelcase
         "rc" 'string-inflection-lower-camelcase
         "rd" 'string-inflection-kebab-case
         "c" 'magit-commit) ; todo should be in vc layer
   "<" (general-key-dispatch 'evil-shift-left
         "p" 'razzi/surround-paragraph
         "d" 'razzi/surround-div) ; todo should be in vc layer
   "M-, p" 'razzi/surround-paragraph
   "M-, v" 'razzi/surround-div
   "g/" 'spacemacs/helm-project-smart-do-search-region-or-symbol
   "g." 'razzi/search-project-whole-word
   "g[" 'helm-etags-select
   "g]" 'dumb-jump-go
   "gf" 'razzi/file-at-point
   "n" 'evil-search-next
   "s-d" 'evil-mc-make-and-goto-next-match
   "s-x" 'helm-M-x)

  (general-define-key :states 'visual
    "!" 'sort-lines
    "$" 'razzi/almost-end-of-line
    "'" 'razzi/surround-with-single-quotes
    "`" 'razzi/surround-with-backticks
    ")" 'razzi/surround-with-parens
    "\"" 'razzi/surround-with-double-quotes
    "]" 'razzi/surround-with-brackets
    "E" 'forward-symbol
    "c" 'evil-change
    "ae" 'mark-whole-buffer
    "il" 'razzi/mark-line-text
    "M-l" 'evil-next-line
    "M-c" 'evil-yank
    "M-d" 'mc/mark-next-symbol-like-this)

  (evil-define-text-object whole-buffer (count &optional beginning end type)
    (evil-range 0 (point-max)))

  (general-define-key :states 'operator
    "E" 'forward-symbol
    "ae" 'whole-buffer
    "SPC" 'evil-inner-symbol)

  (define-key minibuffer-local-map (kbd "C-j") 'exit-minibuffer)

  ; :)))))))
  (define-key helm-find-files-map (kbd "C-t") nil)
  (define-key helm-map (kbd "C-t") nil)

  ;; (company-tng-configure-default)
  (add-hook 'evil-insert-state-exit-hook 'expand-abbrev)
  (add-hook 'focus-out-hook 'garbage-collect)
  (add-hook 'term-mode-hook 'turn-off-evil-mode)

  (defun razzi/dark-terminal ()
    (setq buffer-face-mode-face '(:background "#000000"
                                     :foreground "#FFFFFF"))
    (buffer-face-mode)
    (set-face-background 'hl-line nil)
    (hl-line-mode nil))

  ;; (add-hook 'term-mode-hook 'razzi/dark-terminal)

  (defun razzi/make-parent-directories (filename)
    "Create parent directory if not exists while visiting file."
    (unless (file-exists-p filename)
      (let ((dir (file-name-directory filename)))
        (unless (file-exists-p dir)
          (make-directory dir)))))

  (advice-add 'find-file :before 'razzi/make-parent-directories)

  (defun razzi/replace-control-g-with-nil (char)
    "Make C-g read as nil so that `r C-g` cancels the replace."
    (if (eq char ?\C-g)
        (progn
          (message "Quit")  ; Without calling message, the cursor stays looking like replace
          nil)              ; Returning nil cancels the replace
      char))

  (add-hook 'term-mode-hook (lambda nil
                              (global-hl-line-mode -1)
                              ;; (set-face-foreground 'term "white")
                              ;; (set-face-background 'term "black")
                              (load-theme-buffer-local 'cherry-blossom (current-buffer))))

  ;; (remove-hook 'term-mode-hook (first term-mode-hook))

  (advice-add 'evil-read-key :filter-return 'razzi/replace-control-g-with-nil)

  (advice-add 'spacemacs/check-large-file :around 'no-confirm))

; complain function which will put the string as a comment in a relevant config per mode
; todo use parinfer
; when yyp copy 2 lines, keep cursor on same character
; merge n and N from vim search with * and #
; ui for perspectives, like tmux
; ! fixup commit onto last commit that edited that line
; switch to hydra
; evilmc visual E and $ not working
; q from split doesn't close the split until redraw?
;don't show . and .. in helm
; slurp markdown
; eval current finds outer form in comment
; ' throw quotes on the word
; don't throw the comments all the way to the right
; a function text object python
; o put comma when adding to python collection
; rename file doesn't work if moving in to directory
; definteractive
; https://www.reddit.com/r/emacs/comments/3sd3ue/ask_remacs_sending_text_to_an_ansiterm_buffer/
; tab shouldn't expand abbrevs when it's not on its own

;; (set-face-background 'lsp-face-highlight-read nil)
;; (set-face-background 'lsp-face-highlight-write nil)
