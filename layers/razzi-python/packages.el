(defconst razzi-python-packages '(blacken flycheck-mypy))

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

(defun razzi-python/init-flycheck-mypy ()
  (use-package flycheck-mypy
    :config
    (setq flycheck-python-mypy-args '("--ignore-missing-imports" "--follow-imports=silent"))
    (flycheck-add-next-checker 'python-flake8 'python-mypy)))
