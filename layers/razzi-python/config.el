(defun razzi-python-autoflake ()
  (interactive)
  (razzi/run-script-on-file "autoflake --remove-all-unused-imports -i"))

(defun razzi-python-isort ()
  (interactive)
  (razzi-run-script-on-file "isort"))

(setq flycheck-python-flake8-executable "flake8")
(setq flycheck-flake8rc "~/.config/flake8")
