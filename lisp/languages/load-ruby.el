(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '(".rhtml$" . html-mode) auto-mode-alist))

(require 'rsense)
(setq rsense-home (expand-file-name "~/dotemacs/site-lisp/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))

(add-hook 'ruby-mode-hook
          (lambda ()
	    (ruby-end-mode)
        (setq ac-sources '(ac-source-rsense-constant ac-source-rsense-method ac-source-yasnippet ac-source-abbrev))
	    ))

;(define-key ruby-mode-map (kbd "<return>") 'newline-and-indent)
(define-key ruby-mode-map (kbd "M-.") 'rsense-jump-to-definition)
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")

(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")

(require 'ruby-end)

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
