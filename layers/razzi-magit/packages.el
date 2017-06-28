(defconst razzi-magit-packages
  '(magit))

(defun save-if-buffer-is-file ()
  (if (and buffer-file-name (buffer-modified-p))
      (save-buffer)))

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

(defun razzi-magit/post-init-magit ()
  (define-key evil-normal-state-map (kbd "gs") 'razzi/save-and-status)
  (define-key evil-normal-state-map (kbd "g SPC") 'razzi/magit-commit)
  )
