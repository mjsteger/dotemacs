(require 'ido)
; Turn on ido, which allows for incomplete matches for files
(ido-mode 1)
; Turns on the incomplete matching for other possible things(i.e.
(icomplete-mode t)
; Make ido create files without asking if there is a match
(setq ido-create-new-buffer 'always)
