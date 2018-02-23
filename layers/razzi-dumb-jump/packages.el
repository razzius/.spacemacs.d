(defconst razzi-dumb-jump-packages '(dumb-jump))

(defun razzi-dumb-jump/init-dumb-jump ()
  (use-package dumb-jump
    :init
    (setq dumb-jump-force-searcher 'rg)))
