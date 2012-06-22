(require 'cl)

(defun require-all (requirelist)
  (loop for requirement in requirelist do
  	(load (symbol-name requirement))
  ))

; Base directory that `normal-top-level-add-subdirs-to-load-path' will assume is
; where you stick all your lisp files
(setq default-directory "~/dotemacs/")

; Add all the subdirectories of the this dir
(normal-top-level-add-subdirs-to-load-path)

(require-all '(
	       ekeys ;; my key bindings and some aliases
	       efuncs ;; a bunch of my own utility functions
	       modes ;; configuration for 100-odd emacs modes
	       ))

(when (file-exists-p "~/.custom")
  (load-library "~/.custom"))

(server-start)
