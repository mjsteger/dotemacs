(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory (concat (expand-file-name "~/") "dotemacs" "/site-lisp/snippets/"))
(setq ac-dwim t)
  (set-default 'ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-files-in-current-dir ac-source-symbols))

(define-key ac-completing-map [return] 'ac-complete)



