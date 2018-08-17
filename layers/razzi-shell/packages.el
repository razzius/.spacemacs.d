(setq razzi-shell-packages '(term))

(defun razzi-shell/post-init-term ()
  (evil-define-key 'insert term-raw-map (kbd "C-SPC \"") 'razzi/multi-term-below)
  (evil-define-key 'insert term-raw-map (kbd "M-DEL") (lambda () (interactive) (term-send-raw-string "\C-u"))))
