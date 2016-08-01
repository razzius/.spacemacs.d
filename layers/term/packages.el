(setq term-packages
  '(
    term
    ))

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

(defun term/post-init-term ()
  ; todo make this toggle
  (spacemacs/set-leader-keys-for-major-mode 'term-mode "SPC" 'multi-term-next)
  (spacemacs/set-leader-keys-for-major-mode 'term-mode "k" 'evil-window-up)
  (spacemacs/set-leader-keys-for-major-mode 'term-mode "h" 'evil-window-left)
  (spacemacs/set-leader-keys-for-major-mode 'term-mode "l" 'evil-window-right)
  (spacemacs/set-leader-keys-for-major-mode 'term-mode "j" 'evil-window-down)
  (spacemacs/set-leader-keys-for-major-mode 'term-mode "'" 'razzi/multi-term-below)
  (spacemacs/set-leader-keys-for-major-mode 'term-mode ";" 'razzi/multi-term-right)

  (evil-define-key 'insert term-raw-map
    (kbd "A-<left>") 'term-send-backward-word
    (kbd "A-<right>") 'term-send-forward-word
    (kbd "C-a") 'term-send-raw
    (kbd "C-c") 'term-send-raw
    (kbd "C-d") 'razzi/eof
    (kbd "C-e") 'razzi/term-end-of-line
    (kbd "C-h") 'term-send-backspace
    (kbd "C-k") 'term-send-raw
    (kbd "C-n") 'term-send-down
    (kbd "C-p") 'term-send-up
    (kbd "C-t") 'term-send-raw
    (kbd "C-w") 'term-send-raw
    (kbd "C-z") 'term-send-raw
    (kbd "M-v") 'term-paste
  ))
