(defun razzi/edit-init ()
  (interactive)
  (find-file "~/.spacemacs.d/init.el"))

(evil-leader/set-key
  "e e" 'eval-last-sexp
  "e f" 'eval-defun
  ;; TODO what's up with this? "e l" 'lisp-state-eval-sexp-end-of-line
  "e r" 'eval-region
  "f i" 'razzi/edit-init
  "f r" 'ivy-recentf)

(global-set-key (kbd "C-`") 'describe-key)
(global-set-key (kbd "M--") 'spacemacs/scale-down-font)
(global-set-key (kbd "M-=") 'spacemacs/scale-up-font)
