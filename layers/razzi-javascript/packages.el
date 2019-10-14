(defconst razzi-javascript-packages '(flow-js2-mode
                                      rjsx-mode
                                      prettier-js
                                      flycheck-flow))

(defun razzi-javascript/init-flycheck-flow ()
  (use-package flycheck-flow
    :config
    (defun expand-root (root bin)
      (and root
           (expand-file-name (concat "node_modules/.bin/" bin)
                             root)))

    (defun my/use-local-node-modules ()
      (let* ((root (locate-dominating-file
                    (or (buffer-file-name) default-directory)
                    "node_modules"))
             (flow (expand-root root "flow"))
             (eslint (expand-root root "eslint")))
        (when (and flow (file-executable-p flow))
          (setq-local flycheck-javascript-flow-executable flow))

        (when (and eslint (file-executable-p eslint))
          (setq-local flycheck-javascript-eslint-executable eslint))))

    (add-hook 'flycheck-mode-hook #'my/use-local-node-modules)))

(defun razzi-javascript/init-flow-js2-mode ()
  (use-package flow-js2-mode))

(defun razzi-javascript/init-prettier-js ()
  (use-package prettier-js
    :config
    (setq prettier-js-args '("--no-semi")
          prettier-js-show-errors 'echo)
    (add-hook 'rjsx-mode-hook 'prettier-js-mode)))

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
  (razzi-associate-extension-mode "js" 'rjsx-mode))
