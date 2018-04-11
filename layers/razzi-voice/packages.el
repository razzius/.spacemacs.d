(defconst razzi-voice-packages '())

(defun razzi/voice ()
  (interactive)
  ;; (shell-command "swift ~/projects/swift_speech/r2.swift")
  (start-process "voice" "voice" "swift" "/Users/razzi/projects/swift_speech/r2.swift"))

(defun razzi/dictate ()
  (interactive)
  (start-process "dictate" "dictate" "osascript" "/Users/razzi/projects/swift_speech/dictate.applescript"))

(defun razzi/end-voice ()
  (interactive)
  (delete-process "voice"))
