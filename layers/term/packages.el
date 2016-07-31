(setq term-packages
  '(
    term
    ))

(defun term/post-init-term ()
  (evil-define-key 'insert term-raw-map
    (kbd "M-v") 'term-paste
    (kbd "A-<left>") 'term-send-backward-word
    (kbd "A-<right>") 'term-send-forward-word
    (kbd "C-a") 'term-send-raw
    (kbd "C-c") 'term-send-raw
    (kbd "C-k") 'term-send-raw
    (kbd "C-w") 'term-send-raw
    (kbd "C-z") 'term-send-raw
    (kbd "C-e") 'end-of-line
    (kbd "C-p") 'term-send-up
    (kbd "C-h") 'term-send-backspace))
