(defun razzi/eval-next-paren ()
  (interactive)
  (evil-find-char 1 ?\))
  (call-interactively 'eval-last-sexp))

(defun razzi/eval-paragraph ()
  (interactive)
  (save-excursion
    (evil-forward-paragraph)
    (call-interactively 'eval-last-sexp)))

; (spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "e," 'razzi/eval-next-paren)
; (spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "ep" 'razzi/eval-paragraph)
