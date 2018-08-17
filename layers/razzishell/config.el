;;; config.el --- shell configuration File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Emacs built-in variables

;; move point to the end of buffer on new output
(setq comint-move-point-for-output t)

;; Variables

; (spacemacs|defvar-company-backends eshell-mode)

(defvar razzishell-default-shell (if (eq window-system 'w32)
                                'eshell
                              'ansi-term)
  "Default shell to use in Spacemacs. Possible values are `eshell', `shell',
`term' and `ansi-term'.")

(defvar razzishell-default-position 'full
  "Position of the shell. Possible values are `top', `bottom' and `full'.")

(defvar razzishell-default-height 30
  "Height in percents for the shell window.")

(defvar razzishell-default-term-shell shell-file-name
  "Default shell to use in `term' and `ansi-term' shells.")
