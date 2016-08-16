(setq razzineotree-packages '(neotree))

(defun razzi/neotree-preview ()
  (interactive)
  (spacemacs/neotree-expand-or-open)
  (select-window-0))

(defun razzineotree/post-init-neotree ()
  (use-package neotree
    :config
    (evilified-state-evilify-map neotree-mode-map
      :mode neotree-mode
      :bindings
      ;; (kbd "l") 'spacemacs/neotree-expand-or-open
      (kbd ";") 'razzi/neotree-preview)))
