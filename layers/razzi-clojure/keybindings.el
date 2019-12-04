(defun razzi-clojure-eval-line-sexp ()
  (interactive)
  (save-excursion
    (end-of-line)
    (cider-eval-last-sexp)))

(evil-define-key 'insert clojure-mode-map (kbd "M-RET") 'razzi-clojure-eval-line-sexp)
(evil-define-key 'normal clojure-mode-map (kbd "M-RET") 'razzi-clojure-eval-line-sexp)
(evil-define-key 'insert cider-repl-mode-map (kbd "C-k") 'kill-line)
