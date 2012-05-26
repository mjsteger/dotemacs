(require-all '(
	       rvm ; Supports ruby version manager in emacs
	       helm-config ; Allows for quicksilver autocompletion
	       multi-term ; Multiple terminals
	       jump-char ; Allows jumping ahead characters, shortcut for C-s
	       magit ; Allows for easy interaction with git in emacs
	       projectile ; Project management in emacs
	       fill-column-indicator ; Little blue line to let you see 80 chars
	       popup-kill-ring ; Allows easy traversal of the kill-ring
	       expand-region ; Expands by semantic region
	       flymake ; On the fly syntax checking
	       ))

(rvm-use-default)

(helm-mode 0)

(setq multi-term-program "/bin/bash")

(add-hook 'term-mode-hook
  #'(lambda () (setq autopair-dont-activate t)))

(projectile-global-mode) ;; to enable in all buffers
(setq projectile-enable-caching t)

(setq
 fci-rule-width 1
 fci-rule-color "darkblue")

(setq popup-kill-ring-interactive-insert t)
