; Set up auto-config with the default configurations
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories (concat default-directory "/site-lisp/ac-dict"))

(setq ac-dwim t)
(set-default 'ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-files-in-current-dir ac-source-symbols))

(define-key ac-completing-map [return] 'ac-complete)

(ac-config-default)
(ac-flyspell-workaround)


