(setq term-packages '(term))

(defun razzi/term-end-of-line ()
  (interactive)
  (term-send-right)
  (end-of-line))

(defun razzi/multi-term-below ()
  (interactive)
  (split-window-below)
  (call-interactively 'multi-term))

(defun razzi/multi-term-right ()
  (interactive)
  (split-window-right)
  (call-interactively 'multi-term))

(defun razzi/eof ()
  (interactive)
  (let ((prevname (buffer-name)))
    (message prevname)
    (term-send-raw)
    (sit-for .01)
    (message (buffer-name))
    (when (not (eq prevname (buffer-name)))
      (delete-window))))

(defun razzi/magit-status-pwd ()
  (interactive)
  (let* ((pid (process-id (get-buffer-process (current-buffer))))
        (pwd (shell-command-to-string (format "lsof -a -d cwd -p %d | tail -1 | awk '{printf $NF}'" pid)))
        (git-dir (s-trim (shell-command-to-string (format "git -C %s rev-parse --show-toplevel" pwd)))))
        (magit-status git-dir)))

(defun iqbal-term-send-backtab ()
  "Send backtab to the term process"
  (interactive)
  (term-send-raw-string (kbd "\033[Z")))

(defun razzi/shrink-window-horizontally ()
  (interactive)
  (shrink-window-horizontally 5))

(defun razzi/enlarge-window ()
  (interactive)
  (enlarge-window 5))

(defun razzi/shrink-window ()
  (interactive)
  (shrink-window 5))

(defun razzi/enlarge-window-horizontally ()
  (interactive)
  (enlarge-window-horizontally 5))

(defun term/init-term ()
  (use-package term
    :init
    (defun razzi/switch-to-term-buffer ()
      (interactive)
      (let* (
            (termp (lambda (buf) (eq 'term-mode (buffer-local-value 'major-mode buf))))
            (term (-first termp (buffer-list))))
        (if (null term)
            (razzi/multi-term-workspace)
          (progn
            (switch-to-buffer term)
            (end-of-buffer)
            (term-send-left)
            (evil-append 0 0 nil))
        )
      ))
    )
    (spacemacs/set-leader-keys-for-major-mode 'term-mode "SPC" 'eyebrowse-last-window-config)
    (spacemacs/set-leader-keys-for-major-mode 'term-mode "TAB" 'spacemacs/alternate-buffer)
    (spacemacs/set-leader-keys-for-major-mode 'term-mode "k" 'evil-window-up)
    (spacemacs/set-leader-keys-for-major-mode 'term-mode "g" 'razzi/magit-status-pwd)
    (spacemacs/set-leader-keys-for-major-mode 'term-mode "h" 'evil-window-left)
    (spacemacs/set-leader-keys-for-major-mode 'term-mode "l" 'evil-window-right)
    (spacemacs/set-leader-keys-for-major-mode 'term-mode "j" 'evil-window-down)
    (spacemacs/set-leader-keys-for-major-mode 'term-mode "H" 'razzi/shrink-window-horizontally)
    (spacemacs/set-leader-keys-for-major-mode 'term-mode "J" 'razzi/enlarge-window)
    (spacemacs/set-leader-keys-for-major-mode 'term-mode "K" 'razzi/shrink-window)
    (spacemacs/set-leader-keys-for-major-mode 'term-mode "L" 'razzi/enlarge-window-horizontally)
    (spacemacs/set-leader-keys-for-major-mode 'term-mode "'" 'razzi/multi-term-below)
    (spacemacs/set-leader-keys-for-major-mode 'term-mode ";" 'razzi/multi-term-right)

    (evil-define-key 'insert term-raw-map
      (kbd "A-<left>") 'term-send-backward-word
      (kbd "A-<right>") 'term-send-forward-word
      (kbd "<S-tab>") 'iqbal-term-send-backtab
      (kbd "C-a") 'term-send-raw
      (kbd "C-c") 'term-send-raw
      (kbd "C-d") 'razzi/eof
      (kbd "C-e") 'term-send-raw
      (kbd "C-h") 'term-send-backspace
      (kbd "C-k") 'term-send-raw
      (kbd "C-n") 'term-send-down
      (kbd "C-p") 'term-send-up
      (kbd "C-t") 'term-send-raw
      (kbd "C-w") 'term-send-raw
      (kbd "C-v") 'term-send-forward-word
      (kbd "C-z") 'term-send-raw
      (kbd "M-v") 'term-paste
    )
  )


;; (defun make-my-shell-output-read-only (text)
;;   "Add to comint-output-filter-functions to make stdout read only in my shells."
;;   (if (member (buffer-name) my-shells)
;;       (let ((inhibit-read-only t)
;;             (output-end (process-mark (get-buffer-process (current-buffer)))))
;;         (put-text-property comint-last-output-start output-end 'read-only t))))

;; (defun term/post-init-term ()
  ; todo make this toggle
;; (add-hook 'comint-output-filter-functions 'make-my-shell-output-read-only)
