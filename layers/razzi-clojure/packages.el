(defconst razzi-clojure-packages '(cider))

;; inf-clojure
;; (defun razzi-clojure/init-inf-clojure ()
;;   (use-package inf-clojure))

;; (setq cider-cljs-lein-repl
;;       "(do (require 'figwheel-sidecar.repl-api)
;;            (figwheel-sidecar.repl-api/start-figwheel!)
;;            (figwheel-sidecar.repl-api/cljs-repl))")

(defun razzi-clojure/post-init-cider ()
  (use-package cider
    :config
    ; yes!!
    (setq cider-repl-pop-to-buffer-on-connect 'display-only
          cider-allow-jack-in-without-project t)))

;(evil-define-key 'normal clojure-mode-map (kbd "M-j") 'razzi/open-sexp)
;(evil-define-key 'normal clojure-mode-map (kbd "RET") 'razzi/open-sexp-eol)

;; (defun cider-figwheel-repl ()
;;   (interactive)
;;   (save-some-buffers)
;;   (with-current-buffer (cider-current-repl-buffer)
;;     (goto-char (point-max))
;;     (insert "(require 'figwheel-sidecar.repl-api)
;;              (figwheel-sidecar.repl-api/start-figwheel!) ; idempotent
;;              (figwheel-sidecar.repl-api/cljs-repl)")
;;     (cider-repl-return)))

;; (defun razzi/connect-clojurescript-repl ()
;;   (interactive)
;;   (cider-jack-in)
;;   ; todo repeat until it works ??
;;   (cider-figwheel-repl)
;;   (find-file-at-point "http://localhost:3449"))
