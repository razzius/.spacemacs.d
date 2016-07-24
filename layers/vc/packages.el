(setq vc-packages '(magit))

(defun vc/post-init-magit ()
  (use-package magit
    :config
    (setq
      magit-status-sections-hook
      (delete 'magit-insert-status-headers magit-status-sections-hook))))
