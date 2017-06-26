(defconst razzivoice-packages
  '())


(defun razzi/voice ()
  (interactive)
  ;; (shell-command "swift ~/projects/swift_speech/r2.swift")
  (start-process "voice" "voice" "swift" "/Users/razzi/projects/swift_speech/r2.swift")
  )

(defun razzi/dictate ()
  (interactive)
  ;; (shell-command "swift ~/projects/swift_speech/r2.swift")
  (start-process "dictate" "dictate" "osascript" "/Users/razzi/projects/swift_speech/dictate.applescript")
  This is a testSkinEscape
  )

(defun razzi/end-voice ()
  (interactive)
  ;; (shell-command "swift ~/projects/swift_speech/r2.swift")
  (delete-process "voice")
  )

