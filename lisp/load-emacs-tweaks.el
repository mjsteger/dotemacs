(require-all '(eldoc-extension ; Alters the mode-line in emacs-lisp-mode
	       volatile-highlights ; Highlights some changes, like undo's
	       ))

; Tweaks to how emacs works that are too simple to deserve their own mode
(add-hook 'find-file-hook
	  '(lambda ()
	     (set-fill-column 80)))

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(volatile-highlights-mode t)

