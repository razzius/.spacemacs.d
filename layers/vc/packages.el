(setq vc-packages '(magit git-gutter))

(defun vc/post-init-magit ()
  (use-package magit
    :config
    (setq
      same-window-regexps (append same-window-regexps '("\*magit: .*\*" "\*magit-diff: .*\*"))
      magit-status-sections-hook
        (delete 'magit-insert-status-headers magit-status-sections-hook))
    ))

(defun vc/init-git-gutter ()
  (use-package git-gutter
    :config
    (spacemacs|diminish git-gutter-mode " ")
    (setq
      git-gutter:update-interval .4
      git-gutter:hide-gutter t)
    (git-gutter:linum-setup)
    (global-git-gutter-mode 1)
    ;; (global-linum-mode)
    (add-to-list 'git-gutter:update-hooks 'focus-in-hook)
    ))
