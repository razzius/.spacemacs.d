(defun razzi/eval-next-paren ()
  (interactive)
  (evil-find-char 1 ?\))
  (call-interactively 'eval-last-sexp))

(spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "e," 'razzi/eval-next-paren)
