(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '(".rhtml$" . html-mode) auto-mode-alist))

(require 'ruby-end)
(require 'rsense)
(require 'flymake-ruby)

(setq rsense-home (expand-file-name "~/dotemacs/site-lisp/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))

(add-hook 'ruby-mode-hook
          (lambda ()
	    (ruby-end-mode)
        (setq ac-sources '(ac-source-rsense-method ac-source-words-in-buffer))
        ;(setq ac-sources (cons 'ac-source-rsense-constant (cons 'ac-source-rsense-method ac-sources)))
	    ))

(add-hook 'ruby-mode-hook 'flymake-ruby-load)
;(define-key ruby-mode-map (kbd "<return>") 'newline-and-indent)
(define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")

(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")


(defun chomp (str)
      "Chomp leading and tailing whitespace from STR."
      (while (string-match "\\`\n+\\|^\\s-+\\|\\s-+$\\|\n+\\'"
                           str)
        (setq str (replace-match "" t t str)))
      str)

(defun look-up-ruby-function-at-point()
  (interactive)
  (let ((string-to-search (read-from-minibuffer "Enter the term to search: "  (thing-at-point 'word))))
	(save-window-excursion
	  (shell-command (concat "~/getDocs.rb Filename " string-to-search))
	  (switch-to-buffer "*Shell Command Output*")
	  (browse-url (chomp (buffer-string)))
	  )))
(define-key ruby-mode-map (kbd "C-c h") 'look-up-ruby-function-at-point)

(add-hook 'ruby-mode-hook
          #'(lambda ()
              (push '(?` . ?`)
                    (getf autopair-extra-pairs :code))
              (push '(?/ . ?/)
                    (getf autopair-extra-pairs :code))))


(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings))
