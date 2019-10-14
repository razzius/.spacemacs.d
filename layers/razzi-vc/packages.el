(setq razzi-vc-packages '(magit git-gutter))

(defun razzi-vc/post-init-magit ()
  (use-package magit
    :config
    (add-to-list 'magit-no-confirm 'stage-all-changes)

    (add-hook 'git-commit-mode-hook 'evil-insert-state)

    (set-face-background 'magit-diff-context-highlight "light cyan")
    (set-face-background 'magit-diff-hunk-heading-highlight "gray60")

    (magit-define-popup-action 'magit-push-popup ?p "Push current :D" 'razzi/magit-push)
    (magit-define-popup-action 'magit-push-popup ?h "Push to heroku :O" 'razzi/magit-push-heroku)

    (setq
      magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1
      magit-push-current-set-remote-if-missing nil
      magit-commit-show-diff nil
      magit-status-sections-hook
      '(magit-insert-merge-log
        magit-insert-rebase-sequence
        magit-insert-am-sequence
        magit-insert-sequencer-sequence
        magit-insert-bisect-output
        magit-insert-bisect-rest
        magit-insert-bisect-log
        magit-insert-unstaged-changes
        magit-insert-untracked-files
        magit-insert-staged-changes
        magit-insert-status-headers
        magit-insert-stashes
        magit-insert-unpulled-from-upstream
        magit-insert-unpulled-from-pushremote
        magit-insert-unpushed-to-upstream
        magit-insert-unpushed-to-pushremote))))

(defun razzi-vc/init-git-gutter ()
  (use-package git-gutter
    :config
    (spacemacs|diminish git-gutter-mode " ")
    (setq
      git-gutter:update-interval .4
      git-gutter:hide-gutter t)

    (git-gutter:linum-setup)
    (global-git-gutter-mode 1)

    (add-to-list 'git-gutter:update-hooks 'focus-in-hook)))
