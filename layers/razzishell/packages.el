(setq razzishell-packages
      '(
        company
        helm
        multi-term
        (comint :location built-in)
        xterm-color
        shell
        shell-pop
        term
        esh-help
        magit
        ))

(defun razzi/create-workspace ()
  (interactive)
  (eyebrowse-switch-to-window-config (+ 1 (eyebrowse--get 'last-slot))))

(defun razzi/multi-term-workspace ()
  (interactive)
  (razzi/create-workspace)
  (multi-term))

(defun razzishell/pre-init-helm ()
  (spacemacs|use-package-add-hook helm
    :post-init
    (progn
      (defun spacemacs/helm-shell-history ()
        "Correctly revert to insert state after selection."
        (interactive)
        (helm-comint-input-ring)
        (evil-insert-state))

      ;;shell
      (spacemacs/set-leader-keys-for-major-mode 'shell-mode
        "H" 'spacemacs/helm-shell-history))))

(defun razzishell/init-multi-term ()
  (use-package multi-term
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys "ast" 'shell-pop-multi-term)
      (defun multiterm (_)
        "Wrapper to be able to call multi-term from shell-pop"
        (interactive)
        (multi-term)))
    :config
    (progn
      (defun term-send-tab ()
        "Send tab in term mode."
        (interactive)
        (term-send-raw-string "\t"))
      ;; (add-to-list 'term-bind-key-alist '("<tab>" . term-send-tab))
      ;; multi-term commands to create terminals and move through them.
      (spacemacs/set-leader-keys-for-major-mode 'term-mode "c" 'razzi/multi-term-workspace)
      (spacemacs/set-leader-keys-for-major-mode 'term-mode "p" 'eyebrowse-next-window-config)
      (spacemacs/set-leader-keys-for-major-mode 'term-mode "n" 'eyebrowse-prev-window-config)

      (when (configuration-layer/package-usedp 'projectile)
        (defun projectile-multi-term-in-root ()
          "Invoke `multi-term' in the project's root."
          (interactive)
          (projectile-with-default-dir (projectile-project-root) (multi-term)))
        (spacemacs/set-leader-keys "p$t" 'projectile-multi-term-in-root)))))

(defun razzishell/init-comint ()
  (setq comint-prompt-read-only t))

(defun razzishell/init-xterm-color ()
  (use-package xterm-color
    :init
    (progn
      ;; Comint and Shell
      (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
      (setq comint-output-filter-functions (remove 'ansi-color-process-output comint-output-filter-functions))
      (setq font-lock-unfontify-region-function 'xterm-color-unfontify-region))))

(defun razzishell/init-shell ()
  (defun razzishell-comint-input-sender-hook ()
    "Check certain shell commands.
 Executes the appropriate behavior for certain commands."
    (setq comint-input-sender
          (lambda (proc command)
            (cond
             ;; Check for clear command and execute it.
             ((string-match "^[ \t]*clear[ \t]*$" command)
              (comint-send-string proc "\n")
              (erase-buffer))
             ;; Check for man command and execute it.
             ((string-match "^[ \t]*man[ \t]*" command)
              (comint-send-string proc "\n")
              (setq command (replace-regexp-in-string "^[ \t]*man[ \t]*" "" command))
              (setq command (replace-regexp-in-string "[ \t]+$" "" command))
              (funcall 'man command))
             ;; Send other commands to the default handler.
             (t (comint-simple-send proc command))))))
  (add-hook 'shell-mode-hook 'shell-comint-input-sender-hook))

(defun razzishell/init-shell-pop ()
  (use-package shell-pop
    :defer t
    :init
    (progn
      (setq shell-pop-window-position razzishell-default-position
            shell-pop-window-size     razzishell-default-height
            shell-pop-term-shell      razzishell-default-term-shell
            shell-pop-full-span t)
      (defmacro make-shell-pop-command (type &optional shell)
        (let* ((name (symbol-name type)))
          `(defun ,(intern (concat "shell-pop-" name)) (index)
             (interactive "P")
             (require 'shell-pop)
             (shell-pop--set-shell-type
              'shell-pop-shell-type
              (backquote (,name
                          ,(concat "*" name "*")
                          (lambda nil (funcall ',type ,shell)))))
             (shell-pop index))))
      (make-shell-pop-command shell)
      (make-shell-pop-command term shell-pop-term-shell)
      (make-shell-pop-command multiterm)
      (make-shell-pop-command ansi-term shell-pop-term-shell)

      (defun ansi-term-handle-close ()
        "Close current term buffer when `exit' from term buffer."
        (when (ignore-errors (get-buffer-process (current-buffer)))
          (set-process-sentinel (get-buffer-process (current-buffer))
                                (lambda (proc change)
                                  (when (string-match "\\(finished\\|exited\\)" change)
                                    (kill-buffer (process-buffer proc))
                                    (when (> (count-windows) 1)
                                      (delete-window)))))))
      (add-hook 'term-mode-hook 'ansi-term-handle-close)
      (add-hook 'term-mode-hook (lambda () (linum-mode -1)))

      (spacemacs/set-leader-keys "'" 'razzi/multi-term-workspace))))

(defun razzishell/init-term ()
  (defun term-send-tab ()
    "Send tab in term mode."
    (interactive)
    (term-send-raw-string "\t"))
  ;; hack to fix pasting issue, the paste micro-state won't
  ;; work in term
  (evil-define-key 'normal term-raw-map "p" 'term-paste)
  (evil-define-key 'normal term-raw-map "C-SPC" 'razzi/vertical-split-multi-term)

  ;; (evil-define-key 'insert term-raw-map (kbd "C-SPC") 'multi-term)
  (evil-define-key 'insert term-raw-map (kbd "<tab>") 'term-send-tab)
  (evil-define-key 'insert term-raw-map (kbd "C-SPC \"") 'razzi/multi-term-below)

  (evil-define-key 'insert term-raw-map
    (kbd "C-k") 'term-send-up
    (kbd "C-j") 'term-send-down)
  (evil-define-key 'normal term-raw-map
    (kbd "C-k") 'term-send-up
    (kbd "C-j") 'term-send-down))
