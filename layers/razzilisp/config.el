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

(defun razzi/vector-to-list (vector)
  (append vector nil))

(defmacro let+ (varlist &rest body)
  (when (oddp (length varlist)) (error "odd let+"))
  (let ((bindings (-partition 2 (razzi/vector-to-list varlist))))
    `(let ,bindings ,@body)))

(let+ [a 3] a)

(let+ [a 3 b 4] (+ a b))

(let+ [a 3 b 4 c] (+ a b))

