(require-all '(eldoc-extension ; Alters the mode-line in emacs-lisp-mode
	       volatile-highlights ; Highlights some changes, like undo's
	       popup-kill-ring ; Allows easy traversal of the kill-ring
	       ))

; Tweaks to how emacs works that are too simple to deserve their own modes
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(volatile-highlights-mode t)

(setq popup-kill-ring-interactive-insert t)
