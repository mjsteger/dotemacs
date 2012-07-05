(require 'js2-mode)

(require 'slime-js)
(require 'setup-slime-js)


; js2mode kinda freaks out with autopair, so just let js2 do its thing without
; autopair
(add-hook 'js2-mode-hook
          '(lambda () (setq autopair-dont-activate t)))


(global-set-key (kbd "M-r") 'slime-js-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))

(add-hook 'css-mode-hook
          (lambda ()
            (define-key css-mode-map "\M-\C-x" 'slime-js-refresh-css)
            (define-key css-mode-map "\C-c\C-r" 'slime-js-embed-css)))
