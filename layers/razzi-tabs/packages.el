(defconst razzi-tabs-packages
  '(centaur-tabs))

(defun razzi-tabs/init-centaur-tabs ()
  (use-package centaur-tabs
    :config
    (setq centaur-tabs-cycle-scope 'tabs)

    (defun centaur-tabs-hide-tab (x)
      (let ((name (format "%s" x)))
        (or
         (string-prefix-p "*" name)
         (string-prefix-p "magit:" name))))

    (centaur-tabs-mode)))
