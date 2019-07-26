(defconst razzi-python-packages '(blacken))

(add-hook 'python-mode-hook (lambda ()
                              (setq evil-shift-width 4)))

(setq-default flycheck-disabled-checkers '(python-pylint python-pycompile))

(setq blacken-executable "gray")
(setq flycheck-flake8rc "~/.config/flake8")

(defun razzi-python/init-blacken ()
  (use-package blacken
    :config
                                        ;(add-hook 'python-mode-hook 'blacken-mode)
    ))
