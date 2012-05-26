(setq mac-command-modifier 'meta)

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "M-m") 'move-beginning-of-line)

;; M-x can be hard to hit...
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(defalias 'qrr 'query-replace-regexp) ; Define alias for query replace


;; Shadow vc-mode's keyboard, since magit is usually more useful to me
(global-set-key (kbd "C-x v s") 'magit-status)

;; Set up a nice keybinding for iedit
(global-set-key (kbd "M-'") 'iedit-mode)

;; The original M-z is really hard to hit, and zap-to-char is pretty useful,
;; so...
(global-set-key (kbd "C-x C-k") 'zap-to-char)

; Make it so that C=; toggles the commented-ness of a region
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

; Some org shortcuts
(global-set-key "\C-cr" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

; Ibuffer is just superior to list-buffers, so lets use that
(global-set-key (kbd "C-x C-b") 'ibuffer)

; get the mode-compile stuff together
(global-set-key (kbd "C-c c") 'mode-compile)
(global-set-key (kbd "C-c k") 'mode-compile-kill)

(global-set-key (kbd "C-c C-t") 'fci-mode)

(global-set-key "\M-y" 'popup-kill-ring)
(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-x ~") 'next-error)


(global-set-key (kbd "C-%") 'er/expand-region)

; Set up some hotkeys for going to the ecb windows.
(global-set-key (kbd "C-c n") 'ecb-goto-window-compilation)
(global-set-key (kbd "C-c e") 'ecb-cycle-through-compilation-buffers)
(global-set-key (kbd "C-c i") 'ecb-toggle-compile-window-height)
(global-set-key (kbd "C-c y") 'ecb-goto-window-methods)
(global-set-key (kbd "C-c f") 'toggle-methods-visible)

(global-set-key (kbd "C-c g") 'google)

(global-set-key (kbd "C-c C-c C-f") 'rename-file-and-buffer)

(global-set-key (kbd "C-c C-v") 'eshell)

(global-set-key (kbd "C-x f") 'fill-region)

(global-set-key [(meta n)] 'jump-char-forward)
(global-set-key [(shift meta n)] 'jump-char-backward)
(global-set-key (kbd "M-o") 'zap-to-char)
(global-set-key (kbd "C-c t") 'fci-mode)
