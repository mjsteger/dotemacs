(require-all '(
	       rvm ; Supports ruby version manager in emacs
	       helm-config ; Allows for quicksilver autocompletion
	       jump-char ; Allows jumping ahead characters, shortcut for C-s
	       magit ; Allows for easy interaction with git in emacs
	       projectile ; Project management in emacs
	       expand-region ; Expands by semantic region
	       flymake ; On the fly syntax checking
	       ))

(rvm-use-default)

(projectile-global-mode) ;; to enable in all buffers
(setq projectile-enable-caching t)


