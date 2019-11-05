(defconst razzi-helm-packages '(helm helm-projectile))

(defun razzi-helm-run-project-search (dir)
  (interactive)
  (let ((default-directory dir))
    (call-interactively 'spacemacs/helm-project-smart-do-search)))

(defun razzi-helm-run-magit-status (dir)
  (interactive)
  (let ((default-directory dir))
    (call-interactively 'magit-status)))

(defun raz-helm-projectile-rg ()
  "Projectile version of `helm-rg'."
  (interactive)
  (helm-exit-and-execute-action 'razzi-helm-run-project-search))

(defun raz-helm-projectile-magit-status ()
  "Projectile version of `magit-status'."
  (interactive)
  (helm-exit-and-execute-action 'razzi-helm-run-magit-status))

(defun razzi-helm/post-init-helm ()
  (use-package helm
    :config
    (define-key helm-map (kbd "C-t") nil)
    (define-key helm-map (kbd "M-<backspace>") '(lambda () (interactive) (kill-line 0)))
    (define-key helm-map (kbd "H-<backspace>") 'backward-kill-word)
    (define-key helm-map (kbd "C-h") 'delete-backward-char)))

(defun razzi-helm/post-init-helm-projectile ()
  (use-package helm-projectile
    :config
    (global-set-key (kbd "C-/") nil)
    (define-key undo-tree-map (kbd "C-/") nil)
    (define-key helm-projectile-projects-map (kbd "C-/") 'raz-helm-projectile-rg)
    (define-key helm-projectile-projects-map (kbd "C-;") 'raz-helm-projectile-magit-status)
    (helm-add-action-to-source "ripgrep" 'razzi-helm-run-project-search helm-source-projectile-projects)
    (helm-add-action-to-source "magit" 'razzi-helm-run-magit-status helm-source-projectile-projects)))
