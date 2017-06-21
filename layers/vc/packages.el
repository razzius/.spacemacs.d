(setq vc-packages '(magit git-gutter))

(defun vc/post-init-magit ()
  (use-package magit
    :config
    (setq
      same-window-regexps (append same-window-regexps '("\*magit: .*\*" "\*magit-diff: .*\*"))
      magit-status-sections-hook
      '(
        magit-insert-merge-log
        magit-insert-rebase-sequence
        magit-insert-am-sequence
        magit-insert-sequencer-sequence
        magit-insert-bisect-output
        magit-insert-bisect-rest
        magit-insert-bisect-log
        magit-insert-untracked-files
        magit-insert-unstaged-changes
        magit-insert-staged-changes
        magit-insert-status-headers
        magit-insert-stashes
        magit-insert-unpulled-from-upstream
        magit-insert-unpulled-from-pushremote
        magit-insert-unpushed-to-upstream
        magit-insert-unpushed-to-pushremote
      ))
    (define-key magit-status-mode-map (kbd "cc") 'razzi/magit-commit)
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
