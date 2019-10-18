(defconst razzi-python-packages '(blacken elpy flycheck-mypy))


  ;; python-test))

(add-hook 'python-mode-hook (lambda ()
                              (setq evil-shift-width 4)))

(setq-default flycheck-disabled-checkers '(python-pylint python-pycompile))

(setq blacken-executable "gray")
(setq flycheck-flake8rc "~/.config/flake8")

(setq-default elpy-django-test-runner-args '("test" "--no-setup" "-v" "2"))
(setq-default elpy-test-runner 'elpy-test-django-runner)


(defun razzi-python/init-python-test ()
  (use-package python-test
    :config (add-hook 'compilation-filter-hook 'python-test-track-pdb-prompt)))

(defun razzi-python/init-elpy ()
  (use-package elpy
    :config (elpy-enable)))

(defun razzi-python/init-blacken ()
  (use-package blacken
    :config
                                        ;(add-hook 'python-mode-hook 'blacken-mode)
    ))

(defun razzi-python/init-flycheck-mypy ()
  (use-package flycheck-mypy
    :config
    (setq flycheck-python-mypy-args '("--ignore-missing-imports" "--follow-imports=silent"))
    ;(flycheck-add-next-checker 'python-flake8 'python-mypy)
    ))
