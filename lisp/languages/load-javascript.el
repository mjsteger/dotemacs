(require 'js2-mode)

; js2mode kinda freaks out with autopair, so just let js2 do its thing without
; autopair
(add-hook 'js2-mode-hook
          '(lambda () (setq autopair-dont-activate t)))
