(defconst razzi-tabs-packages
  '(centaur-tabs))

(defun razzi-tabs/init-centaur-tabs ()
  (use-package centaur-tabs
    :config
    (setq centaur-tabs-cycle-scope 'tabs)
    (centaur-tabs-mode)))
