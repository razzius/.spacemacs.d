(defun razzi-mouse-open-file-on-click ()
  (interactive)
  (let ((string-at-point (ffap-string-at-point)))
    (when (and (not (string-empty-p string-at-point))
               (file-exists-p string-at-point))
      (find-file string-at-point))))

(global-set-key [mouse-1] 'razzi-mouse-open-file-on-click)

(defun razzi-mouse-scroll-up-copy-mode-in-vterm (event)
  (interactive (list last-input-event))
  (when (and (eq major-mode 'vterm-mode)
             (not vterm-copy-mode))
    (vterm-copy-mode))
  (mwheel-scroll event))

(defun razzi-mouse-prevent-scroll-past-end-of-file ()
  (interactive)
  (save-excursion
    (move-to-window-line -1)

    (let ((lines (line-number-at-pos (point-max)))
          (point-line (line-number-at-pos (point))))
      (when (< (1+ point-line) lines)
        (scroll-up 1)))))

(global-set-key [wheel-up] 'razzi-mouse-scroll-up-copy-mode-in-vterm)
(global-set-key [wheel-down] 'razzi-mouse-prevent-scroll-past-end-of-file)

(defun razzi-ns-drag-n-drop (event &optional new-frame force-text)
  "Insert the path to the file dropped in."
  (interactive "e")
  (let* ((window (posn-window (event-start event)))
         (arg (car (cdr (cdr event))))
         (type (car arg))
         (data (car (cdr arg)))
         (name (s-replace-all '((" " . "\\ ")) data)))
    (vterm-send-string name)))

(global-set-key [drag-n-drop] 'razzi-ns-drag-n-drop)
