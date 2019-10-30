(defconst razzi-python-packages '(blacken flycheck-mypy))

(setq-default flycheck-disabled-checkers '(python-pylint python-pycompile))

(defun razzi-python/init-blacken ()
  (use-package blacken
    :config
    (add-hook 'python-mode-hook 'blacken-mode)))

(defun razzi-python/init-flycheck-mypy ()
  (use-package flycheck-mypy
    :config
    (flycheck-add-next-checker 'python-flake8 'python-mypy)))
