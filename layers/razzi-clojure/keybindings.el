(defun razzi-clojure-eval-final-sexp ()
  (interactive)
  (save-excursion
    (end-of-buffer)
    (let ((inhibit-message t))
      (cider-eval-last-sexp))))

(evil-define-key 'normal clojure-mode-map (kbd "M-RET") 'razzi-clojure-eval-final-sexp)
(evil-define-key 'insert clojure-mode-map (kbd "M-RET") 'razzi-clojure-eval-final-sexp)
