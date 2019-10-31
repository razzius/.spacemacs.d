(defconst razzi-tabs-packages
  '(centaur-tabs))

(defun razzi-tabs/init-centaur-tabs ()
  (use-package centaur-tabs
    :config
    (setq centaur-tabs-cycle-scope 'tabs
          centaur-tabs-set-close-button nil)

    (defun centaur-tabs-hide-tab (buffer)
      (let ((name (format "%s" buffer)))
        (or
         (string-prefix-p "*" name)
         (and (string-prefix-p "magit" name)
              (s-contains? ":" name)))))

    (centaur-tabs-mode)))
