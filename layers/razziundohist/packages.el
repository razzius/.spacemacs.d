(setq razziundohist-packages '(undohist))

(defun razziundohist/init-undohist ()
  (use-package undohist
    :init
    (setq undohist-directory (expand-file-name "undo-history" spacemacs-cache-directory))
    :config
    (undohist-initialize)))
