(defconst razzi-tab-completion-packages '(company))

(defun tab-complete ()
  "Either cycle completion or expand snippet"
  (interactive)
  (if (null (yas-expand))
      (company-select-next)))

(defun razzi-tab-completion/init-company ()
  (use-package company
    :init
    (setq company-idle-delay .12
          company-minimum-prefix-length 2
          company-require-match nil
          company-dabbrev-ignore-case nil
          company-dabbrev-downcase nil)

    (add-hook 'after-init-hook 'global-company-mode)

    (company-tng-configure-default)
    (define-key company-active-map (kbd "<tab>") 'tab-complete)
    (define-key company-active-map (kbd "C-w") nil)))
