(defun razzi/magit-commit ()
  (interactive)
  (save-if-buffer-is-file)
  (when (not (magit-anything-staged-p))
    (magit-run-git "add" "-u"))
  (let ((same-window-regexps nil))
    (magit-commit)))

(defun razzi/save-and-status ()
  (interactive)
  (save-if-buffer-is-file)
  (magit-status))

(defun razzi/magit-push ()
  (interactive)
  (magit-run-git "push"))

(defun razzi/magit-pull ()
  (interactive)
  (magit-run-git "pull"))

(define-key evil-normal-state-map (kbd "gs") 'razzi/save-and-status)
(define-key evil-normal-state-map (kbd "gp") 'razzi/magit-push)
(define-key evil-normal-state-map (kbd "gl") 'razzi/magit-pull)
(define-key evil-normal-state-map (kbd "g SPC") 'razzi/magit-commit)
