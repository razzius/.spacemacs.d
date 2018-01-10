(defconst razzi-dired-packages '(dired dired+))

(defun razzi-dired/pre-init-dired+ ()
  (use-package dired+
    :config
    (setq diredp-hide-details-initially-flag t)))

(defun razzi-dired/post-init-dired ()
  (use-package dired
    :config
    (setq
      dired-recursive-copies 'always
      dired-recursive-deletes 'always
      diredp-hide-details-initially-flag t)

    (define-key dired-mode-map (kbd "c") 'find-file)
    (define-key dired-mode-map (kbd ".") 'dired-up-directory)
    (define-key dired-mode-map (kbd "C-h") 'dired-up-directory)
    (evil-define-key 'normal dired-mode-map (kbd "gs") 'magit-status)

    (add-hook 'dired-mode-hook 'dired-hide-details-mode)))
