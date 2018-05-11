(defconst razzi-python-packages '(blacken))

(add-hook 'python-mode-hook (lambda ()
                              (setq evil-shift-width 4)))

(setq-default flycheck-disabled-checkers '(python-pylint python-pycompile))

(defun razzi-python/init-blacken ()
  (use-package blacken))
