(defconst razzicompletion-packages
  '(
    company
    company-flx
    yasnippet
    ))

(toggle-debug-on-error)

(defun tab-complete ()
  "Either cycle completion or expand snippet"
  (interactive)
  (if (or (not yas/minor-mode)
          (null (do-yas-expand)))
      (company-simple-complete-next)))

(defun razzicompletion/init-company ()
  (use-package company
    :init

    ; (define-key company-active-map (kbd "C-w") 'nil)
    ; (define-key company-active-map (kbd "C-h") 'nil)
    (add-hook 'after-init-hook 'global-company-mode)
    (setq company-idle-delay .2
          company-minimum-prefix-length 2
          company-requre-match nil
          company-dabbrev-ignore-case nil
          company-dabbrev-downcase nil)
    ;; (evil-define-key 'insert company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)
    ;; (push '(company-semantic :with company-yasnippet) company-backends)
    :config
    (spacemacs|diminish company-mode " ⓐ" " a")
  ))

; (push '(company-semantic :with company-yasnippet) company-backends)

(defun razzicompletion/init-company-flx ()
  (use-package company-flx
    :init
    (company-flx-mode)
    ))


(defun razzicompletion/init-yasnippet ()
  (use-package yasnippet
    :init
    (yas-global-mode)
    :config
    ;; (define-key yas-minor-mode-map (kbd "TAB") nil)
    ;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
    ;; (define-key yas-minor-mode-map [tab] nil)

    define-category (and log-edit-listfun )
    ;; (define-key evil-normal-state-map (kbd "TAB") 'tab-complete)
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


;(define-key yas-minor-mode-map (kbd "TAB") nil)

;; (define-key evil-normal-state-map (kbd "TAB") 'tab-complete-or-next-field)
;(define-key yas-keymap [(control tab)] 'yas-next-field)
;(define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)
