(defun razzi-python-autoflake ()
  (interactive)
  (razzi-run-script-on-file "autoflake --remove-all-unused-imports -i"))

(defun razzi-python-isort ()
  (interactive)
  (razzi-run-script-on-file "isort"))

(defun razzi-python-gray ()
  (interactive)
  (razzi-run-script-on-file "gray"))

(setq flycheck-python-flake8-executable "flake8")
(setq flycheck-flake8rc "~/.config/flake8")

(add-hook 'python-mode-hook (lambda () (setq evil-shift-width 4)))
