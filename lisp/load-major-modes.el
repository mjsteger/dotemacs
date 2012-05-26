(require-all '(
	       haml-mode ; Major mode for haml
	       markdown-mode ; Major mode to edit markdown
	       js2-mode
	       ))

(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

; js2mode kinda freaks out with autopair, so just let js2 do its thing without
; autopair
(add-hook 'js2-mode-hook
          '(lambda () (setq autopair-dont-activate t)))
