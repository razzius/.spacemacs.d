(defconst razzi-helm-packages
  '(helm))

(defun razzi-helm/post-init-helm ()
  (use-package helm)
  :config
  (define-key helm-map (kbd "C-h") 'delete-backward-char))
