(defun razzi/edit-init ()
  (interactive)
  (find-file "~/.spacemacs.d/init.el"))

(defun razzi/put-after ()
  (interactive)
  (evil-with-single-undo
    (evil-insert-newline-below)
    (indent-for-tab-command)
    (insert (s-trim (current-kill 0)))
    (forward-line)))

(evil-leader/set-key
  "ESC" 'kill-this-buffer
  "e e" 'eval-last-sexp
  "e f" 'eval-defun
  "e l" 'lisp-state-eval-sexp-end-of-line
  "e r" 'eval-region
  "f i" 'razzi/edit-init
  "f r" 'ivy-recentf
  "o" 'razzi/put-after)

(global-set-key (kbd "C-`") 'describe-key)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M--") 'spacemacs/scale-down-font)
(global-set-key (kbd "M-=") 'spacemacs/scale-up-font)
