(autoload 'autopair-global-mode "autopair" nil t)
(autopair-global-mode)

;; Highlight the line you are currently on
(global-hl-line-mode t)

;; Set the line numbers
(global-linum-mode 1)

;;shows a tree of undos in a seperate buffer. Use C-x u to visualize!
(require 'undo-tree)
(global-undo-tree-mode)

;; Turn on global-subword-mode, to recognize word boundaries
;; in camelCase
(global-subword-mode t)

;; Make a symbol appear where we last set the mark
(require 'visible-mark)
(global-visible-mark-mode)

;; Automagically opened compressed files if I `Find file` them
(auto-compression-mode 1)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode)

;; Load up iedit, which allows you to edit all instances of a region, like an instance string-replace
(require 'iedit)

(require 'coding-utils)

(add-hook 'find-file 'coding-hook)

(setq enable-recursive-minibuffers t)

;; Make it so that if I have a region selected and then type, it replaces the region
(pending-delete-mode t)

(show-paren-mode 1)

(setq show-paren-style 'parenthesis)


(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))

;; (autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

;; (defun prelude-turn-on-flyspell ()
;;   "Force flyspell-mode on using a positive argument.  For use in hooks."
;;   (interactive)
;;   (flyspell-mode +1))

;; (add-hook 'message-mode-hook 'prelude-turn-on-flyspell)
;; (add-hook 'text-mode-hook 'prelude-turn-on-flyspell)
;; (add-hook 'emacs-lisp-mode-hook 'prelude-turn-on-flyspell)

(defun my-auto-tex-parameters ()
  "Automatically select the tex packages to include."
  ;; default packages for ordinary latex or pdflatex export
  (setq org-export-latex-default-packages-alist
        '(("" "graphicx" t))))

(defun my-auto-tex-header ()
  (setq org-export-latex-header
	"\\documentclass[11pt]{article}
\\renewcommand*{\contentsline}[3]{\csname l@#1\endcsname{#2}{}}"))

(require 'flymake)

(my-auto-tex-header)
(my-auto-tex-parameters)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


(defadvice server-edit (after pop-back-to-edit-source () )
  "Bounce back to whatever sent us the edit"
  (lower-frame))

(ad-activate 'server-edit)

(defun highlight-trouble-words ()
  (interactive)
  (font-lock-add-keywords nil
                          '(("\\(FIXME\\|TODO\\|BUG\\)" 1 font-lock-warning-face t))))

(add-hook 'find-file-hook 'highlight-trouble-words)

(defun my-erc-hook (match-type nick message)
  "Shows a growl notification, when user's nick was mentioned. If the buffer is currently not visible, makes it sticky."
  (cond
   (equal system-type "darwin")
   (growl
    (concat "ERC: name mentioned on: " (buffer-name (current-buffer)))
    message
    ))
  ((t) (message (concat "ERC: name mentioned on: " (buffer-name (current-buffer))
                        message))))
(add-hook 'erc-text-matched-hook 'my-erc-hook)


(setq initial-scratch-message ";; Do you wrestle with dreams?
;; Do you contend with shadows?
;; Do you move in a kind of sleep?

;; Time has slipped away
;; Your life is stolen
;; You tarried with trifles
;; Victim of your folly

;; He’s the best of us.
;; The best of our best, the best that each of us will ever build or ever love.
;; So pray for this Guardian of our growth and choose him well, for if he be not truly blessed, then our designs are surely frivolous and our future but a tragic waste of hope.
;; Bless our best and adore for he doth bear our measure to the Cosmos.
")
