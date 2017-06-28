(defconst razzi-api-blueprint-packages
  '(apib-mode))


(defun razzi-api-blueprint/init-apib-mode ()
  (use-package apib-mode
    :config
    (add-to-list 'auto-mode-alist '("\\.apib\\'" . apib-mode))))
