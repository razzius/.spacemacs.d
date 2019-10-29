(defconst razzi-vterm-packages '(vterm))

(defun razzi-vterm/init-vterm ()
  (use-package vterm
    :config

    (defun razzi-vterm-disable-line-highlight ()
      (setq-local global-hl-line-mode nil))

    (add-hook 'vterm-mode-hook 'razzi-vterm-disable-line-highlight)
    (add-hook 'vterm-exit-functions #'(lambda (buf) (when buf (kill-buffer buf))))

    (define-key vterm-mode-map (kbd "M-v") 'vterm-yank)

    (evil-set-initial-state 'vterm-mode 'insert)))
