(defconst razzi-evil-packages
  '(evil-surround))

(defun razzi-evil/init-evil-surround ()
  (use-package evil-surround
    :config
    (global-evil-surround-mode 1)
    (define-key evil-visual-state-map (kbd "s") 'evil-surround-region)))
