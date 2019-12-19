(defconst razzi-dumb-jump-packages '(dumb-jump))

(defun razzi-dumb-jump/post-init-dumb-jump ()
  (use-package dumb-jump
    :init
    (setq
     dumb-jump-confirm-jump-to-modified-file nil
     dumb-jump-force-searcher 'rg)))
