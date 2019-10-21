(defconst razzi-focus-out-packages '(super-save))

(defun razzi-focus-out/init-super-save ()
  (use-package super-save
    :config
    (super-save-mode)))
