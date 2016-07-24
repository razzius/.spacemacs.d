(defconst tl-packages '(
                        (local :location local)
                        ))

(defun tl/init-local ()
  (use-package local
    :config
    (message "vetest")))

