(setq term-packages
  '(
    term
    ))

(defun term/post-init-term ()
  ;; Turn off C-c child keybindings as I want C-c to cancel
  (evil-define-key 'insert term-raw-map
    (kbd "M-v") 'term-paste
    (kbd "C-c C-z") nil
    (kbd "C-c C-d") nil
    (kbd "C-c") 'term-send-raw
    (kbd "C-e") 'end-of-line
    (kbd "C-h") 'term-send-backspace))
