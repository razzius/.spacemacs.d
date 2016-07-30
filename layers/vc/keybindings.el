(defun razzi/save-and-status ()
  (interactive)
  (save-if-buffer-is-file)
  (magit-status))

(define-key evil-normal-state-map (kbd "gs") 'razzi/save-and-status)
