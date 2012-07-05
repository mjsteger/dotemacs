(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell
      (replace-regexp-in-string "[[:space:]\n]*$" ""
        (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; (defun setenv-from-shell (varname)
;;   (setenv varname (replace-regexp-in-string
;;                    "[ \t\n]*$"
;;                    ""
;;                    (shell-command-to-string (concat "$SHELL --login -i -c 'echo $" varname "'")))))
;; (setenv-from-shell "PYTHONPATH")
;; (setenv-from-shell "PATH")

(add-hook 'eshell-mode-hook 'set-exec-path-from-shell-PATH)

;; (add-hook 'eshell-mode-hook 'setenv-from-shell "PYTHONPATH")


;; This command is AMAZING. I recommend mapping it to `C-x v' or `C-x w'
;; depending on which is easier on your keyboard.

(defun banish (l) (append (cdr l) (list (car l))))
(defun ido-jump-to-window ()
  (interactive)
  (let* ((visible-buffers (banish (mapcar '(lambda (window) (buffer-name (window-buffer window))) (window-list))))
         (buffer-name (ido-completing-read "Window: " visible-buffers))
         window-of-buffer)
    (if (not (member buffer-name visible-buffers))
        (error "'%s' does not have a visible window" buffer-name)
      (setq window-of-buffer
                (delq nil (mapcar '(lambda (window)
                                       (if (equal buffer-name (buffer-name (window-buffer window)))
                                           window
                                         nil))
                                  (window-list))))
      (select-window (car window-of-buffer)))))

(define-key global-map (kbd "C-x w") 'ido-jump-to-window)

;; All me, baby. Try it out. If theres a region, it'll kill that,
;; otherwise it'll just kill the word behind.
(defun backward-kill-word-or-kill-region (&optional arg)
  (interactive "P")
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (if (equal arg nil)
        (subword-backward-kill 1)
      (subword-backward-kill arg))))

(global-set-key (kbd "C-w") 'backward-kill-word-or-kill-region)


;; Stolen from emacswiki
(defun hlu-make-script-executable ()
  "If file starts with a shebang, make `buffer-file-name' executable"
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-min))
      (when (and (looking-at "^#!")
		 (not (file-executable-p buffer-file-name)))
	(set-file-modes buffer-file-name
			(logior (file-modes buffer-file-name) #o100))
	(message (concat "Made " buffer-file-name " executable"))))))

(add-hook 'after-save-hook 'hlu-make-script-executable)

;; Whitespace fucks up poor version control, so lets do away with it
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))


(defun toggle-current-window-dedication ()
 (interactive)
 (let* ((window    (selected-window))
        (dedicated (window-dedicated-p window)))
   (set-window-dedicated-p window (not dedicated))
   (message "Window %sdedicated to %s"
            (if dedicated "no longer " "")
            (buffer-name))))

(add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)

(defun my-goto-match-beginning ()
  (when isearch-forward (goto-char isearch-other-end)))

(defun toggle-methods-visible ()
  (interactive)
  (if (< ecb-windows-width 1)
	 (setq ecb-windows-width 40)
    (setq ecb-windows-width 0.008))
  (ecb-rebuild-methods-buffer-fully)
  (ecb-redraw-layout-full))

(defun watch-buffer-pdf ()
  (interactive)
  (watch-buffer (concat "yes \" \" | pdflatex " (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))))

(defun reopen-file (buffername)
  (if (not (equal (get-buffer (file-name-nondirectory buffername)) nil))
      (kill-buffer (file-name-nondirectory buffername)))
  (find-file-other-window buffername))

(defun reopen-same-file ()
  (reopen-file (buffer-file-name)))

(defun reopen-same-file-pdf ()
  (reopen-file  (concat (file-name-sans-extension (buffer-file-name)) ".pdf")))

(defun watch-buffer-markdown ()
  (interactive)
  (watch-buffer (concat "pandoc " (buffer-file-name) " -o " (file-name-sans-extension (buffer-file-name)) ".pdf")))
  ;(watch-buffer-elisp "reopen-same-file-pdf"))
  ;(reopen-file (concat (file-name-sans-extension (buffer-file-name)) ".pdf")))
  ;(watch-buffer-elisp "markdown-export-and-view"))

(defun watch-buffer-markdown-online ()
  (interactive)
  (watch-buffer-elisp "markdown-export-and-view"))

(defun google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: ")))))

(defun rename-file-and-buffer ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (message "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file name new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)))))))

(defun buffer-contains-substring (string &optional regex)
  (save-excursion
    (save-match-data
      (goto-char (point-min))
      (if regex
	  (search-forward-regexp string nil t)
	(search-forward string nil t)))))

(defun check-if-onlinep ()
  )
