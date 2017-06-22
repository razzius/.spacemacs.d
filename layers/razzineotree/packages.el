(setq razzineotree-packages '(neotree))

(defun razzi/neotree-preview ()
  (interactive)
  (spacemacs/neotree-expand-or-open)
  (winum-select-window-0-or-10))

(defun razzi/activate-neotree ()
  (interactive)
  (if (winum-get-window-by-number 0)
      (winum-select-window-0)
    (neotree-toggle)))

(defun razzineotree/post-init-neotree ()
  (use-package neotree
    :config
    (evilified-state-evilify-map neotree-mode-map
      :mode neotree-mode
      :bindings
      (kbd "l") 'spacemacs/neotree-expand-or-open
      (kbd "h") 'spacemacs/neotree-collapse-or-up
      (kbd ";") 'razzi/neotree-preview)))
