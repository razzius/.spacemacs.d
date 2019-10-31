(defun razzi-mouse-open-file-on-click ()
  (interactive)
  (evil-normal-state)
  (find-file (ffap-string-at-point)))

(global-set-key [mouse-1] 'razzi-mouse-open-file-on-click)

(defun razzi-mouse-prevent-scroll-past-end-of-file ()
  (interactive)
  (save-excursion
    (let ((this-scroll-margin (min (max 0 scroll-margin)
                                   (truncate (/ (window-body-height) 4.0)))))
      (move-to-window-line (- -1 this-scroll-margin)))

    (let ((lines (count-lines (point-min) (point-max)))
          (point-line (count-lines 1 (point))))
      (when (< (1+ point-line) lines)
        (scroll-up 1)))))

(global-set-key [wheel-down] 'razzi-mouse-prevent-scroll-past-end-of-file)
