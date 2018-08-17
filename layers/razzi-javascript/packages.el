(defconst razzi-javascript-packages '(rjsx-mode prettier-js))

(defun razzi-javascript/init-prettier-js ()
  ;; (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  (setq prettier-js-args '("--no-semi"))
  (setq prettier-js-show-errors 'echo))

(defun razzi-javascript/init-rjsx-mode ()
  (use-package rjsx-mode
    :bind (:map rjsx-mode-map
      ("C-c r" . rjsx-rename-tag-at-point))
    :interpreter (("node" . rjsx-mode))
    :config (progn
              (electric-indent-mode -1)
              (setq js2-basic-offset 2
                    js2-highlight-level 3
                    js2-bounce-indent-p t
                    js2-mode-show-strict-warnings nil)))
  (add-hook 'rjsx-mode-hook 'flycheck-mode)
  (razzi/associate-extension-mode "js" 'rjsx-mode))
