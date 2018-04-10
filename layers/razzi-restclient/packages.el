(defconst razzi-restclient-packages '(restclient))

(defun razzi-restclient/init-restclient ()
  (use-package restclient
    :config
    (razzi/declare-extension-mode "rest" 'restclient-mode)))
