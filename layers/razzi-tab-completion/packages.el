(defconst razzi-tab-completion-packages '(company yasnippet))

(defun razzi-tab-completion-tab-complete ()
  "Either cycle completion or expand snippet.
  If an expansion would have a space after point, delete that space."
  (interactive)
  (let ((current-symbol (or (thing-at-point 'symbol) "")))
    (if (or (s-contains? "_" current-symbol)
              (s-contains? "-" current-symbol)
              (s-contains? "/" current-symbol)
              (null (yas-expand)))
        (company-select-next)
      (when (string= (string (char-after)) " ")
          (delete-forward-char 1)))))

(defun razzi-tab-completion/post-init-yasnippet ()
  (use-package yasnippet
    :init
    (setq yas-snippet-dirs '("~/.spacemacs.d/snippets"))
    (yas-global-mode)))

(defun razzi-tab-completion/post-init-company ()
  (use-package company
    :init
    (setq company-idle-delay .12
          company-minimum-prefix-length 2
          company-require-match nil
          company-dabbrev-ignore-case nil
          company-dabbrev-downcase nil)

    (add-hook 'after-init-hook 'global-company-mode)

    (company-tng-configure-default)
    (define-key company-active-map (kbd "<tab>") 'razzi-tab-completion-tab-complete)
    (define-key company-active-map (kbd "C-h") nil)
    (define-key company-active-map (kbd "C-w") nil)))
