(require-all '(
	       ;rvm ; Supports ruby version manager in emacs
	       helm-config ; Allows for quicksilver autocompletion
	       jump-char ; Allows jumping ahead characters, shortcut for C-s
	       magit ; Allows for easy interaction with git in emacs
	       projectile ; Project management in emacs
	       expand-region ; Expands by semantic region
	       flymake ; On the fly syntax checking
	       rspec-mode ; Better editing for rspec
           popwin
           jabber-autoloads
           ;rinari
           ;mumamo-fun
           expand-region
	       ))


(setq display-buffer-function 'popwin:display-buffer) ; Allows \*.*\* buffers to be closed when popped up with C-g

;(rvm-use-default)

(winner-mode) ; Allow you go back and forward in buffer setups

(projectile-global-mode) ;; to enable in all buffers
(setq projectile-enable-caching t)

(setq mumamo-chunk-coloring 'submode-colored)
     (add-to-list 'auto-mode-alist '("\\.rhtml\\'" . eruby-html-mumamo))
     (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-html-mumamo))

(push '("*eshell pop*" :stick t) popwin:special-display-config)
(push '("*anything*" :stick t) popwin:special-display-config)
(push '("\*yari.*"  :stick t :regexp t) popwin:special-display-config)
(push '("\*.*\*" :stick t :regexp t) popwin:special-display-config)

(global-set-key (kbd "C-c C-l") 'jabber-switch-to-roster-buffer)


(defvar growl-program "/usr/local/bin/growlnotify")

(defun growl (title message &optional id)
  (if (eq id nil)
      (start-process "growl" " growl"
                     growl-program title "-w")
    (start-process "growl" " growl"
                   growl-program title "-w" "-d" id))
  (process-send-string " growl" message)
  (process-send-string " growl" "\n")
  (process-send-eof " growl"))



;; Make jabber.el notify through growl when I get a new message
(setq jabber-message-alert-same-buffer nil)
(defun pg-jabber-growl-notify (from buf text proposed-alert)
  "(jabber.el hook) Notify of new Jabber chat messages via Growl"
  (when (or jabber-message-alert-same-buffer
            (not (memq (selected-window) (get-buffer-window-list buf))))
    (if (jabber-muc-sender-p from)
        (growl (format "(PM) %s"
                       (jabber-jid-displayname (jabber-jid-user from)))
               (format "%s: %s" (jabber-jid-resource from) text)
               (format "jabber-from-%s" (jabber-jid-resource from)))
      (growl (format "%s" (jabber-jid-displayname from))
             text "jabber-from-unknown"))))
(add-hook 'jabber-alert-message-hooks 'pg-jabber-growl-notify)
(global-set-key (kbd "C-@") 'er/expand-region)

(add-hook 'jabber-chat-mode-hook 'flyspell-mode)
