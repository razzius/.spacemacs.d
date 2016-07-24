(defconst razzicompletion-packages
  '(
    company
    company-flx
    yasnippet
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
    (setq company-idle-delay .12
          company-minimum-prefix-length 2
          company-requre-match nil
          company-dabbrev-ignore-case nil
          company-dabbrev-downcase nil)
    :config
    (spacemacs|diminish company-mode " ⓐ" " a")
  ))


(defun razzicompletion/init-company-flx ()
  (use-package company-flx
    :init
    (company-flx-mode)))


(defun razzicompletion/init-yasnippet ()
  (use-package yasnippet
    :init
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
