;; Making evil a required package doesn't work, but this does.
(with-eval-after-load 'evil
  (evil-define-text-object razzi/evil-outer-comment (count &optional beg end type)
    (save-excursion
      (evil-first-non-blank)
      (let* ((start-of-non-semi (re-search-backward "^\s*[^\s;]"))
             (start-of-comment (+ 1 (line-end-position)))
             (next-non-comment (progn
                                 (forward-char)
                                 (re-search-forward "^\s*[^\s;]")))
             (end-of-comment (line-beginning-position)))
        (evil-range start-of-comment end-of-comment type :expanded t))))

  ;; TODO skip tags buffer :[
  (define-key evil-normal-state-map (kbd "<backtab>") 'previous-buffer)
  (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "M-/") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-operator-state-map (kbd "SPC") 'evil-inner-symbol)
  (define-key evil-outer-text-objects-map "c" 'razzi/evil-outer-comment)
  (define-key evil-visual-state-map (kbd "!") 'sort-lines))
