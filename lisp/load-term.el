(require 'multi-term)

(setq multi-term-program "/bin/bash")

(add-hook 'term-mode-hook
  #'(lambda () (setq autopair-dont-activate t)))
