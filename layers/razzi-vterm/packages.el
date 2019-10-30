(defconst razzi-vterm-packages '(vterm vterm-toggle))

(defun razzi-vterm-get-or-create ()
  (interactive)
  (let ((buffer (get-buffer "vterm")))
    (if buffer
        (switch-to-buffer buffer)
      (vterm)))
  (evil-append 1))

(defun razzi-vterm-split ()
  (interactive)
  (split-window-vertically)
  (vterm)
  (evil-append 1))

(defun razzi-vterm-send-c-w ()
  (interactive)
  (vterm-send-key "w" nil nil t))

(defun razzi-vterm-send-m-f ()
  (interactive)
  (vterm-send-key "f" nil t nil))

(defun razzi-vterm-send-m-b ()
  (interactive)
  (vterm-send-key "b" nil t nil))

(defun razzi-vterm-send-c-u ()
  (interactive)
  (vterm-send-key "u" nil nil t))

(defun razzi-vterm-send-space ()
  (interactive)
  (vterm-send-key " "))

(defun razzi-vterm/init-vterm ()
  (use-package vterm
    :config

    (defun razzi-vterm-disable-line-highlight ()
      (setq-local global-hl-line-mode nil))

    (add-hook 'vterm-mode-hook 'razzi-vterm-disable-line-highlight)
    (add-hook 'vterm-exit-functions #'(lambda (buf) (when buf (kill-buffer buf))))
    (add-hook 'vterm-mode-hook 'evil-insert-state)

    (evil-define-key 'insert vterm-mode-map (kbd "C-a") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "<tab>") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-c") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-d") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-e") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-h") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-k") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-n") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-p") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-w") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-z") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-\\") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC [") #'evil-normal-state)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC n") #'centaur-tabs-forward)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC p") #'centaur-tabs-backward)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC SPC") #'spacemacs/alternate-buffer)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC c") #'vterm)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC j") #'windmove-down)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC k") #'windmove-up)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC \"") #'razzi-vterm-split)
    (evil-define-key 'insert vterm-mode-map (kbd "C-y") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "S-SPC") #'razzi-vterm-send-space)
    (evil-define-key 'insert vterm-mode-map (kbd "H-<backspace>") 'razzi-vterm-send-c-w)
    (evil-define-key 'insert vterm-mode-map (kbd "H-<right>") 'razzi-vterm-send-m-f)
    (evil-define-key 'insert vterm-mode-map (kbd "H-<left>") 'razzi-vterm-send-m-b)
    (evil-define-key 'insert vterm-mode-map (kbd "M-<backspace>") 'razzi-vterm-send-c-u)
    (evil-define-key 'insert vterm-mode-map (kbd "M-v") 'vterm-yank)))

(defun razzi-vterm/init-vterm-toggle ()
  (use-package vterm-toggle
    :config
    (setq centaur-tabs-buffer-groups-function 'vmacs-awesome-tab-buffer-groups)
    (defun vmacs-awesome-tab-buffer-groups ()
      "`vmacs-awesome-tab-buffer-groups' control buffers' group rules. "
      (list
       (cond
        ((derived-mode-p 'eshell-mode 'term-mode 'shell-mode 'vterm-mode)
         "Term")
        ((string-match-p (rx (or
                              "\*Helm"
                              "\*helm"
                              "\*tramp"
                              "\*Completions\*"
                              "\*sdcv\*"
                              "\*Messages\*"
                              "\*Ido Completions\*"
                              ))
                         (buffer-name))
         "Emacs")
        (t "Common"))))

    (setq vterm-toggle--vterm-buffer-p-function 'vmacs-term-mode-p)
    (defun vmacs-term-mode-p(&optional args)
      (derived-mode-p 'eshell-mode 'term-mode 'shell-mode 'vterm-mode))))

