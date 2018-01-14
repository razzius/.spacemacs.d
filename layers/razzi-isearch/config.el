(defun razzi/isearch-transpose-char ()
  (interactive)
  (when (> (length isearch-string) 1)
    (let* ((string isearch-string)
           (len (length isearch-string))
           (second-to-last-char (aref string (- len 2)))
           (last-char (aref string (- len 1))))
      (isearch-pop-state)
      (isearch-pop-state)
      (isearch-process-search-char last-char)
      (isearch-process-search-char second-to-last-char))))


(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
(define-key isearch-mode-map (kbd "C-j") 'isearch-done)
(define-key isearch-mode-map (kbd "C-t") 'razzi/isearch-transpose-char)
(define-key isearch-mode-map (kbd "M-v") 'isearch-yank-pop)