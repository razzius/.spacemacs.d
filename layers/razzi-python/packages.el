(defconst razzi-python-packages '())

(add-hook 'python-mode-hook (lambda ()
                              (setq evil-shift-width 4)))

(setq-default flycheck-disabled-checkers '(python-pylint python-pycompile))
