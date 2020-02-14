(defconst razzi-tabs-packages
  '(centaur-tabs))

(defun razzi-tabs-hide-special-tabs (buffer)
  (let ((name (format "%s" buffer)))
    (or
     (string-prefix-p "*" name)
     (centaur-tabs-hide-tab buffer)
     (and (string-prefix-p "magit" name)
          (s-contains? ":" name)))))

(defun razzi-tabs/init-centaur-tabs ()
  (use-package centaur-tabs
    :config
    (setq centaur-tabs-cycle-scope 'tabs
          centaur-tabs-set-close-button nil
          centaur-tabs-hide-tab-function 'razzi-tabs-hide-special-tabs)

    (centaur-tabs-mode)))
