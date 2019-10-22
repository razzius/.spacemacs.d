(defun razzi/magit-commit ()
  (interactive)
  (razzi-save-if-buffer-is-file)
  (when (not (magit-anything-staged-p))
    (magit-run-git "add" "-u"))
  (let ((same-window-regexps nil))
    (magit-commit-create)))

(defun razzi/magit-push ()
  (interactive)
  (magit-run-git "push"))

(defun razzi/magit-push-heroku ()
  (interactive)
  (magit-run-git "push" "heroku" "master"))

(defun razzi/magit-pull ()
  (interactive)
  (magit-run-git "pull-current"))

(defun razzi/magit-reset-last ()
  (interactive)
  (magit-run-git "reset" "@^"))

(general-define-key :keymaps 'magit-status-mode-map
                    "c" (general-key-dispatch 'evil-change
                          "c" 'razzi/magit-commit
                          "e" 'magit-commit-extend)
                    "@" 'razzi/magit-reset-last)

(define-key evil-normal-state-map (kbd "gs") 'razzi/save-and-status)
(define-key evil-normal-state-map (kbd "gp") 'razzi/magit-push)
(define-key evil-normal-state-map (kbd "gb") 'magit-blame)
(define-key evil-normal-state-map (kbd "gl") 'razzi/magit-pull)
(define-key evil-normal-state-map (kbd "g SPC") 'razzi/magit-commit)
