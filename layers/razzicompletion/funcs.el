(spacemacs|add-toggle completion
  :status
  (bound-and-true-p company-mode)
  :on
  (company-mode)
  :off
  (company-mode -1)
  :documentation "Enable auto-completion."
  :evil-leader "ta")
