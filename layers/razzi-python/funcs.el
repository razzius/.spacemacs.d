(defun razzi-python/get-python-module ()
  (let* ((root (s-append "/" (s-chomp (shell-command-to-string "git root"))))
         (relative-path (s-chop-prefix root (buffer-file-name))))
    (s-replace "/" "." (file-name-sans-extension relative-path))))

(defun razzi-python/copy-test-file-path ()
  (interactive)
  (let ((module (razzi-python/get-python-module)))
    (kill-new module)
    (message "Copied module '%s' to the clipboard." module)))

(defun razzi-python/copy-test-method-path ()
  (interactive)
  (let* ((module (razzi-python/get-python-module))
         (method (nose-py-testable))
         (path (format "%s.%s" module method)))
    (kill-new path)
    (message "Copied path '%s' to the clipboard." path)))