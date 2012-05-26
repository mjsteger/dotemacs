; Set up auto-config with the default configurations
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories (concat default-directory "/site-lisp/ac-dict"))

(ac-config-default)
(ac-flyspell-workaround)


