(defconst razzi-python-packages '(blacken flycheck-mypy nose))

(setq-default flycheck-disabled-checkers '(python-pylint python-pycompile))

(defun razzi-python/post-init-blacken ()
  (use-package blacken
    :config
    (add-hook 'python-mode-hook 'blacken-mode)))

(defun razzi-python/init-flycheck-mypy ()
  (use-package flycheck-mypy
    :config
    (flycheck-add-next-checker 'python-flake8 'python-mypy)))

(defun razzi-python/post-init-nose ()
  (use-package nose))

; todo f snippet has duplicate function versus format
