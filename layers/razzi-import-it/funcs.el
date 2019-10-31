(defun razzi-import-it-get-import-path ()
  (when (get-buffer "*import_it-output*")
    (with-current-buffer "*import_it-output*"
      (erase-buffer)))

  (let ((error-file (make-temp-file "import_it-error")))
    (call-process
     "import_it"
     nil
     (list "*import_it-output*" error-file)
     nil
     (thing-at-point 'symbol) (s-trim (shell-command-to-string "git root")) (buffer-file-name)))

  (razzi-buffer-string "*import_it-output*"))


(defun razzi-import-it-import-this ()
  (interactive)
  (save-buffer)
  (let ((import-path (razzi-import-it-get-import-path)))
    (save-excursion
      (goto-char (point-min))
      (insert import-path))
    (razzi-python-isort)
    (razzi-python-autoflake)
    (flycheck-buffer)))
