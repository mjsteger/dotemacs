;; Improves bookmarks, which are pretty nifty. Adds tags to bookmarking,
;; bookmarks with the same name.  Bookmarks also keep metadata, such as the
;; number of times visited, and the time of the last visit
(require 'bookmark+)

;; This setup allows me to export the bookmarks to zsh, and along with a zsh
;; setup that has cdablevars(setopt cdablevars), you can cd to the emacs
;; bookmarks.
(defadvice bookmark-write-file
  (after local-directory-bookmarks-to-zsh-advice activate)
  (local-directory-bookmarks-to-zsh))

(defun local-directory-bookmarks-to-zsh ()
  (interactive)
  (when (and (require 'tramp nil t)
             (require 'bookmark nil t))
    (set-buffer (find-file-noselect "~/.zsh.bmk" t t))
    (delete-region (point-min) (point-max))
    (insert "# -*- mode:sh -*-\n")
    (let (collect-names)
      (mapc (lambda (item)
              (let ((name (replace-regexp-in-string "-" "_" (car item)))
                    (file (cdr (assoc 'filename
                                      (if (cddr item) item (cadr item))))))
                (when (and (not (tramp-tramp-file-p file))
                           (file-directory-p file))
                  (setq collect-names (cons (concat "~" name) collect-names))
                  (insert (format "%s=\"%s\"\n" name (expand-file-name file) name)))))
            bookmark-alist)
      (insert ": " (mapconcat 'identity collect-names " ") "\n"))
    (let ((backup-inhibited t)) (save-buffer))
    (kill-buffer (current-buffer))))
