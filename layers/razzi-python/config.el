(defun razzi-python-autoflake ()
  (interactive)
  (razzi-run-script-on-file "autoflake --remove-all-unused-imports -i"))

(defun razzi-python-isort ()
  (interactive)
  (razzi-run-script-on-file "isort"))

(defun razzi-python-gray ()
  (interactive)
  (razzi-run-script-on-file "gray"))

(setq blacken-executable "gray")
(setq flycheck-python-flake8-executable "flake8")
(setq flycheck-flake8rc "~/.config/flake8")
(setq flycheck-python-mypy-args '("--ignore-missing-imports" "--follow-imports=silent"))

(add-hook 'python-mode-hook (lambda () (setq evil-shift-width 4)))
