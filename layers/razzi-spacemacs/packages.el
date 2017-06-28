(defconst razzi-spacemacs-packages
  '(restart-emacs persistent-scratch))

(defun razzi-spacemacs/init-restart-emacs ()
  (use-package restart-emacs
    :config
    (evil-leader/set-key "q r" 'restart-emacs)))

(defun razzi-spacemacs/init-persistent-scratch ()
  (use-package persistent-scratch
    :config
    (persistent-scratch-setup-default)))
