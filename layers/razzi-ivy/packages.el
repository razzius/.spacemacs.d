(defconst razzi-ivy-packages
  '(ivy))


(defun razzi-ivy/post-init-ivy ()
  (use-package ivy
    :config
    (define-key ivy-mode-map (kbd "M-j") 'ivy-immediate-done)))
