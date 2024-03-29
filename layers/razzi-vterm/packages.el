(defconst razzi-vterm-packages '(vterm vterm-toggle))

(defun razzi-vterm-toggle ()
  (interactive)
  (razzi-save-if-buffer-is-file)
  (vterm-toggle)
  (if (eq major-mode 'vterm-mode)
      (evil-append 1)
    (evil-normal-state)))

(defun razzi-vterm-buffer-vterm-p (buffer)
  (eq (razzi-buffer-major-mode buffer) 'vterm-mode))

(defun razzi-vterm-buffers ()
  (seq-filter #'razzi-vterm-buffer-vterm-p (buffer-list)))

(defun razzi-vterm-previous ()
  (interactive)
  (let ((vterm-buffers (razzi-vterm-buffers)))
    (when (> (length vterm-buffers) 1)
      (switch-to-buffer (nth 1 vterm-buffers)))))

(defun razzi-vterm-split-vertically ()
  (interactive)
  (split-window-vertically)
  (windmove-down)
  (vterm)
  (evil-append 1))

(defun razzi-vterm-split-horizontally ()
  (interactive)
  (split-window-horizontally)
  (windmove-right)
  (vterm)
  (evil-append 1))

(defun razzi-vterm-enlarge-window ()
  (interactive)
  (enlarge-window 5))

(defun razzi-vterm-new ()
  (interactive)
  (vterm)
  (dotimes (_ (length (razzi-vterm-buffers)))
    (centaur-tabs-move-current-tab-to-right)))

(defun razzi-vterm-cancel-and-prompt ()
  (interactive)
  (vterm-send-ctrl-c)
  (evil-append 1))

(defun razzi-vterm-send-m-del ()
  (interactive)
  (vterm-send-key "<backspace>" nil t nil))

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

(defun razzi-vterm-send-c-p ()
  (interactive)
  (vterm-send-key "p" nil nil t))

(defun razzi-vterm-send-hyper-up ()
  (interactive)
  (vterm-send-key "<up>" nil t nil))

(defun razzi-vterm-send-hyper-down ()
  (interactive)
  (vterm-send-key "<down>" nil t nil))

(defun razzi-vterm/init-vterm ()
  (use-package vterm
    :config
    (setq vterm-max-scrollback 10000)

    (defun razzi-setup-vterm ()
      (setq-local
       global-hl-line-mode nil
       mode-line-format nil))

    (defun razzi-vterm-end-copy-mode ()
      (interactive)
      (vterm-copy-mode -1)
      (when (eq evil-state 'normal)
        (evil-append 1)))

    (defun razzi-vterm-close-buffer-on-exit (buf)
      (when buf (kill-buffer buf))
      (when (> (count-windows) 1)
	(delete-window)))

  (define-key vterm-copy-mode-map (kbd "<return>") 'razzi-vterm-end-copy-mode)
  (evil-define-key 'normal vterm-mode-map (kbd "<return>") 'razzi-vterm-end-copy-mode)

    (add-hook 'vterm-mode-hook 'razzi-vterm-disable-line-highlight)
    (add-hook 'vterm-mode-hook 'razzi-vterm-disable-status-line)
    (add-hook 'vterm-exit-functions #'razzi-vterm-close-buffer-on-exit)

    (add-hook 'vterm-mode-hook 'evil-insert-state)

    (evil-define-key 'normal vterm-mode-map (kbd "o") #'browse-url-at-point)
    (evil-define-key 'normal vterm-mode-map (kbd "C-SPC c") #'razzi-vterm-new)
    (evil-define-key 'normal vterm-mode-map (kbd "C-c") #'razzi-vterm-cancel-and-prompt)
    (evil-define-key 'normal vterm-mode-map (kbd "M-w") 'kill-current-buffer)

    (evil-define-key 'insert vterm-mode-map (kbd "<escape>") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "<tab>") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC '") #'vterm-toggle)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC <escape>") #'evil-normal-state)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC SPC") #'razzi-vterm-previous)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC [") #'evil-normal-state)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC \"") #'razzi-vterm-split-vertically)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC %") #'razzi-vterm-split-horizontally)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC c") #'razzi-vterm-new)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC h") #'windmove-left)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC j") #'windmove-down)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC J") #'razzi-vterm-enlarge-window)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC k") #'windmove-up)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC C-k") #'windmove-up)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC l") #'windmove-right)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC m") #'spacemacs/toggle-maximize-buffer)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC n") #'centaur-tabs-forward)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC p") #'centaur-tabs-backward)
    (evil-define-key 'insert vterm-mode-map (kbd "C-\\") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-a") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-c") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-d") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-e") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-h") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-k") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-l") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-n") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-p") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-r") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-t") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-u") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-w") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-y") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-z") #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "H-<backspace>") 'razzi-vterm-send-m-del)
    (evil-define-key 'insert vterm-mode-map (kbd "H-<left>") 'razzi-vterm-send-m-b)
    (evil-define-key 'insert vterm-mode-map (kbd "H-<right>") 'razzi-vterm-send-m-f)
    (evil-define-key 'insert vterm-mode-map (kbd "H-<up>") 'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "M-'") 'centaur-tabs-backward)
    (evil-define-key 'insert vterm-mode-map (kbd "M-;") 'centaur-tabs-forward)
    (evil-define-key 'insert vterm-mode-map (kbd "M-1") 'centaur-tabs-select-beg-tab)
    (evil-define-key 'insert vterm-mode-map (kbd "M-2") 'centaur-tabs-select-visible-tab)
    (evil-define-key 'insert vterm-mode-map (kbd "M-3") 'centaur-tabs-select-visible-tab)
    (evil-define-key 'insert vterm-mode-map (kbd "M-4") 'centaur-tabs-select-visible-tab)
    (evil-define-key 'insert vterm-mode-map (kbd "M-5") 'centaur-tabs-select-visible-tab)
    (evil-define-key 'insert vterm-mode-map (kbd "M-6") 'centaur-tabs-select-visible-tab)
    (evil-define-key 'insert vterm-mode-map (kbd "M-7") 'centaur-tabs-select-visible-tab)
    (evil-define-key 'insert vterm-mode-map (kbd "M-8") 'centaur-tabs-select-visible-tab)
    (evil-define-key 'insert vterm-mode-map (kbd "M-9") 'centaur-tabs-select-end-tab)
    (evil-define-key 'insert vterm-mode-map (kbd "M-n") 'razzi-vterm-new)
    (evil-define-key 'insert vterm-mode-map (kbd "M-<backspace>") 'razzi-vterm-send-c-u)
    (evil-define-key 'insert vterm-mode-map (kbd "M-[") 'evil-normal-state)
    (evil-define-key 'insert vterm-mode-map (kbd "M-j") 'vterm-send-return)
    (evil-define-key 'insert vterm-mode-map (kbd "M-p") 'razzi-vterm-send-c-p)
    (evil-define-key 'insert vterm-mode-map (kbd "M-t") 'razzi-vterm-new)
    (evil-define-key 'insert vterm-mode-map (kbd "M-v") 'vterm-yank)
    (evil-define-key 'insert vterm-mode-map (kbd "M-w") 'kill-current-buffer)
    (evil-define-key 'insert vterm-mode-map (kbd "H-<up>") 'razzi-vterm-send-hyper-up)
    (evil-define-key 'insert vterm-mode-map (kbd "H-<down>") 'razzi-vterm-send-hyper-down)
    (evil-define-key 'insert vterm-mode-map (kbd "S-SPC") #'razzi-vterm-send-space)))

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
