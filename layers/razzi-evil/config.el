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

  (define-key evil-outer-text-objects-map "c" 'razzi/evil-outer-comment)
  (define-key evil-visual-state-map (kbd "!") 'sort-lines))
