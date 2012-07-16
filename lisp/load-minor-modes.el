(require-all '(
	       rvm ; Supports ruby version manager in emacs
	       helm-config ; Allows for quicksilver autocompletion
	       jump-char ; Allows jumping ahead characters, shortcut for C-s
	       magit ; Allows for easy interaction with git in emacs
	       projectile ; Project management in emacs
	       expand-region ; Expands by semantic region
	       flymake ; On the fly syntax checking
	       rspec-mode ; Better editing for rspec
           popwin
	       ))

(setq display-buffer-function 'popwin:display-buffer) ; Allows \*.*\* buffers to be closed when popped up with C-g

(rvm-use-default)

(winner-mode) ; Allow you go back and forward in buffer setups

(projectile-global-mode) ;; to enable in all buffers
(setq projectile-enable-caching t)

(push '("*eshell pop*" :stick t) popwin:special-display-config)
