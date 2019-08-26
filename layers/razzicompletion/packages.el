(defconst razzicompletion-packages
  '(yasnippet
    company-flx
    hippie-exp))

(defun razzicompletion/init-company-flx ()
  (use-package company-flx
    :init
    (company-flx-mode)))

(defun razzicompletion/post-init-yasnippet ()
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

(defun razzicompletion/post-init-hippie-exp ()
  (use-package hippie-exp)
    :init
    (define-key evil-insert-state-map (kbd "<C-i>")
      (make-hippie-expand-function '(
        try-expand-line
        try-expand-line-all-buffers)))

    (unbind-key "C-p" evil-insert-state-map)
    ;; (define-key evil-insert-state-map [remap evil-complete-previous] 'evil-complete-previous)
    (define-key evil-insert-state-map (kbd "C-p") 'evil-complete-previous)

    ;todo does this do anything?
    (defadvice hippie-expand-substitute-string (after he-paredit-fix)
      "Remove extra paren when expanding line in paredit"
      (if (and smartparens-mode (equal (substring str -1) ")"))
          (progn (backward-delete-char 1) (forward-char))))

    (advice-add 'razzi-expand-line :after 'hippie-expand-substitute-string))
