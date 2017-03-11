(defconst razzicompletion-packages
  '(
    company
    company-flx
    yasnippet
    hippie-exp
    ))

(defun tab-complete ()
  "Either cycle completion or expand snippet"
  (interactive)
  (if (null (do-yas-expand))
      (company-simple-complete-next)))

(defun razzicompletion/init-company ()
  (use-package company
    :init
    (add-hook 'after-init-hook 'global-company-mode)
    ; todo make dabbrev work
    ;; (add-to-list 'company-backends 'company-dabbrev t)
    (setq company-idle-delay .12
          company-minimum-prefix-length 2
          company-requre-match nil
          company-dabbrev-ignore-case nil
          company-dabbrev-downcase nil)
    :config
    (define-key company-active-map (kbd "C-w") nil)
    (define-key company-active-map (kbd "<return>") nil)
    (define-key company-active-map (kbd "<tab>") 'company-complete-selection)
    (spacemacs|diminish company-mode " ⓐ" " a")
  ))


(defun razzicompletion/init-company-flx ()
  (use-package company-flx
    :init
    (company-flx-mode)))


(defun razzicompletion/init-yasnippet ()
  (use-package yasnippet
    :init
    (setq yas-snippet-dirs "~/.spacemacs.d/snippets")
    (yas-global-mode)
    :config
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    (define-key yas-minor-mode-map (kbd "<tab>") nil)
    (define-key yas-minor-mode-map [tab] nil)
    (spacemacs|diminish yas-minor-mode " ⓨ" " y")
    ))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
    (backward-char 1)
    (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-complete-or-next-field ()
  (interactive)
  (if (or (not yas/minor-mode)
      (null (do-yas-expand)))
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
      (null (do-yas-expand))
      (company-abort))
      (company-complete-selection)))

;; (defun abort-company-or-yas ()
;;   (interactive)
;;   (if (null company-candidates)
;;       (yas-abort-snippet)
;;     (company-abort)))

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
