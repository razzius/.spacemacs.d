(setq razzi-code-packages
  '(evil-commentary aggressive-indent))

(defun razzi-code/init-evil-commentary ()
  (use-package evil-commentary
    :init
    (evil-commentary-mode)))

(defun razzi-code/init-aggressive-indent ()
  (use-package aggressive-indent
    :init
    (global-aggressive-indent-mode 1)))
