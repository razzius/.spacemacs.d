(defconst razzi-restclient-packages '(restclient))

(defun razzi-restclient/init-restclient ()
  (use-package restclient
    :config
    (razzi/associate-extension-mode "rest" 'restclient-mode)))
