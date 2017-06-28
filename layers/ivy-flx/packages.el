(defconst ivy-flx-packages
  '(ivy flx))

(defun ivy-flx/post-init-ivy ()
  (use-package ivy
    :config
    (setq ivy-re-builders-alist
          '((t . ivy--regex-fuzzy)))
    (setq ivy-initial-inputs-alist nil))
    (define-key ivy-minibuffer-map (kbd "C-h") 'delete-backward-char)
    (define-key ivy-minibuffer-map (kbd "C-w") 'evil-delete-backward-word))

(setq ivy-minibuffer-faces
      '(ivy-minibuffer-match-face-3))

(defun ivy-flx/post-init-flx ()
  (use-package flx))
