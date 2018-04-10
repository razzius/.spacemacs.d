(defconst razzi-projectile-packages '(projectile))

(defun razzi-projectile/post-init-projectile ()
  (setq projectile-switch-project-action 'helm-projectile-ag))
