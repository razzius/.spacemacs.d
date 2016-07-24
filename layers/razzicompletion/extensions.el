(setq razzicompletion-pre-extensions '())
(setq razzicompletion-post-extensions '(company-simple-complete))

(defun setup-company-ok ()
  ;; (define-key company-active-map (kbd "TAB") 'company-simple-complete-next)
  ;; (define-key company-active-map [tab] 'company-simple-complete-next)
  (define-key company-active-map (kbd "TAB") 'tab-complete)
  (define-key company-active-map [tab] 'tab-complete)
  (define-key company-active-map (kbd "C-w") 'nil)
  (define-key company-active-map (kbd "C-h") 'nil)
  (add-to-list 'company-frontends 'company-simple-complete-frontend))

(defun razzicompletion/init-company-simple-complete ()
  (use-package company-simple-complete
    :init
    (add-hook 'after-init-hook 'setup-company-ok)))
    ;; (with-eval-after-load 'company-mode 'setup-company-ok)
    ;; '(add-hook 'company-mode-hook 'setup-company-ok)
    ;; ))

        ; (define-key evil-insert-state-map (kbd "TAB") 'company-simple-complete-next)
        ; (define-key evil-insert-state-map [tab] 'company-simple-complete-next)
        ; (define-key company-active-map (kbd "TAB") 'company-simple-complete-next)
        ; (define-key company-active-map [tab] 'company-simple-complete-next)
        ; (add-to-list 'company-frontends 'company-simple-complete-frontend))))

;; (defun razzicompletion/init-company-simple-complete ()

;;   (use-package company-simple-complete
;;     :init
;;     (define-key company-active-map (kbd "TAB") 'company-simple-complete-next)
;;     (define-key company-active-map (kbd "<S-tab>") 'company-simple-complete-previous)
;;     (define-key company-active-map (kbd "RET") nil)))

    ;; (put 'company-simple-complete-next 'company-keep t)
    ;; (put 'company-simple-complete-previous 'company-keep t)
    ;; (ad-activate 'company-set-selection)
    ;; (ad-activate 'company-tooltip--simple-update-offset)
    ;; (ad-activate 'company-tooltip--lines-update-offset)))
