(defconst razzi-javascript-packages '(flow-js2-mode
                                      rjsx-mode
                                      prettier-js
                                      flycheck-flow))

(defun find-npm-bin (name)
  (let* ((root (locate-dominating-file (buffer-file-name) "node_modules"))
         (npm-bin (concat root "node_modules/.bin"))
         (executable (expand-file-name name npm-bin)))
    (when (file-executable-p executable)
      executable)))

(defun razzi-javascript/init-flycheck-flow ()
  (use-package flycheck-flow
    :config

    (defun my/use-local-node-modules ()
      (let ((flow (find-npm-bin "flow"))
            (eslint (find-npm-bin "eslint")))

        (when flow
          (setq-local flycheck-javascript-flow-executable flow))

        ;; todo should not configure eslint here
        (when eslint
          (setq-local flycheck-javascript-eslint-executable eslint))))

    (add-hook 'flycheck-mode-hook #'my/use-local-node-modules)))

(defun razzi-javascript/init-flow-js2-mode ()
  (use-package flow-js2-mode))

(defun razzi-javascript/init-prettier-js ()
  (use-package prettier-js
    :config

    (defun razzi/use-local-prettier-hook ()
      (setq-local prettier-js-command (find-npm-bin "prettier")))

    (add-hook 'rjsx-mode-hook #'prettier-js-mode)
    (add-hook 'prettier-js-mode-hook #'razzi/use-local-prettier-hook)))

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
