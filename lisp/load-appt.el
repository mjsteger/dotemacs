(display-time)
(add-hook 'diary-hook 'appt-make-list)
(when (file-exists-p "~/diary") (diary 0))
(setq appt-message-warning-time 15)
(setq appt-display-interval 5)

(setq sound "~/Music/misc/alarm-clock-1.wav")
(defun mikey-popup (title msg &optional icon)
  (interactive)
  (start-process-shell-command "ring" nil
                (concat "afplay " sound))
  (growl title msg)
  (message (concat title ": " msg)))

(defun mikey-appt-display (min-to-app new-time msg)
  (mikey-popup (format "Appointment in %s minute(s)" min-to-app) msg))
(setq appt-disp-window-function (function mikey-appt-display))
