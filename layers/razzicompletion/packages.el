(defconst razzicompletion-packages
  '(yasnippet
    hippie-exp))

(defun tab-complete ()
  "Either cycle completion or expand snippet"
  (interactive)
  (if (null (yas-expand))
      (company-simple-complete-next)))


;; ??
(defun razzicompletion/init-company-flx ()
  (use-package company-flx
    :init
    (company-flx-mode)))


(defun razzicompletion/init-yasnippet ()
  (use-package yasnippet
    :init
    (setq yas-snippet-dirs '("~/.spacemacs.d/snippets"))
    (yas-global-mode)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
    (backward-char 1)
    (if (looking-at "->") t nil)))))

;; ??
(defun tab-complete-or-next-field ()
  (interactive)
  (if (or (not yas/minor-mode)
      (null (yas-expand)))
      (if company-candidates
      (company-complete-selection)
    (if (check-expansion)
      (progn
        (company-manual-begin)
        (if (null company-candidates)
        (progn
          (company-abort)
          (yas-next-field))))
      (yas-next-field)))))

(defun expand-snippet-or-complete-selection ()
  (interactive)
  (if (or (not yas/minor-mode)
      (null (yas-expand))
      (company-abort))
      (company-complete-selection)))

(defun razzicompletion/init-hippie-exp ()
  (use-package hippie-exp)
    :init
    (define-key evil-insert-state-map (kbd "<C-i>")
      (make-hippie-expand-function '(
        try-expand-line
        try-expand-line-all-buffers)))

    ;todo does this do anything?
    (defadvice hippie-expand-substitute-string (after he-paredit-fix)
      "Remove extra paren when expanding line in paredit"
      (if (and smartparens-mode (equal (substring str -1) ")"))
          (progn (backward-delete-char 1) (forward-char))))

    (ad-activate 'hippie-expand-substitute-string))
