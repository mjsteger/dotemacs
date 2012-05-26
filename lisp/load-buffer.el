; Dont ask me questions, just do it ibuffer!
(setq ibuffer-expert t)
(setq ibuffer-auto-mode t)

(setq ibuffer-saved-filter-groups
      '(("home"
	 ("elisp" (or (filename . ".emacs.d")
                      (mode . emacs-lisp-mode)))
	 ("Org" (or (mode . org-mode)
		    (filename . "OrgMode")))
	 ("Code" (or (mode . python-mode)
		     (mode . c-mode)))
	 ("Web Dev" (or (mode . html-mode)
			(mode . css-mode)
			(mode . js2-mode)))
	 ("ERC" (mode . erc-mode))
	 ("Ruby" (mode . ruby-mode))
	 ("Magit" (name . "\*magit.*" ))
	 ("Help" (or (name . "\*Help\*")
		     (name . "\*Apropos\*")
		     (name . "\*info\*"))))))

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-switch-to-saved-filter-groups "home")))
