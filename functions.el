;;; -*- lexical-binding: t; -*-
;;; package --- Summary
;;; Commentary:
;;; Code:

;; Functions
(defun get-point (symbol &optional arg)
  "Get the point.
SYMBOL.
ARG."
  (funcall symbol arg)
  (point)
  )

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "Copy thing between beg & end into kill ring.
BEGIN-OF-THING.
END-OF-THING.
ARG."
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end)))
  )

(defun paste-to-mark(&optional arg)
  "Paste things to mark, or to the prompt in shell-mode"
  (let ((pasteMe
         (lambda()
           (if (string= "shell-mode" major-mode)
               (progn (comint-next-prompt 25535) (yank))
             (progn (goto-char (mark)) (yank) )))))
    (if arg
        (if (= arg 1)
            nil
          (funcall pasteMe))
      (funcall pasteMe))
    ))

(defun copy-word (&optional arg)
  "Copy words at point into ‘kill-ring’.
ARG."
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
  (message "Copying word at point into kill-ring...")
  ;; (Paste-to-mark arg)
  )

(defun duplicate-current-line ()
  "Duplicate the current line."
  (interactive)
  (beginning-of-line nil)
  (let ((b (point)))
    (end-of-line nil)
    (copy-region-as-kill b (point)))
  (beginning-of-line 2)
  (open-line 1)
  (yank)
  (back-to-indentation))


; ctags
(defun crear-tags (dir-name)
  "Create tags file.
DIR-NAME."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -R -e --languages='php' --exclude='cache' %s" path-to-ctags dir-name (directory-file-name dir-name)))
)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %.
ARG."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun copy-line (&optional arg)
"Do a ‘kill-line’ but copy rather than kill.
This function directly calls ‘kill-line’, so see documentation of ‘kill-line’
for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting ‘kill-read-only-ok’ to t.
ARG."
  (interactive "P")
  (read-only-mode 1)
  (kill-line arg)
  (read-only-mode 0))


;; iedit
(defun iedit-dwim (arg)
  "Start iedit but use \\[narrow-to-defun] to limit its scope.
ARG."
  (interactive "P")
  (if arg
      (iedit-mode)
    (save-excursion
      (save-restriction
        (widen)
        ;; this function determines the scope of `iedit-start'.
        (if iedit-mode
            (iedit-done)
          ;; `current-word' can of course be replaced by other
          ;; functions.
          (narrow-to-defun)
          (iedit-start (current-word) (point-min) (point-max)))))))


;; Edit files as root
;; http://emacsredux.com/blog/2013/04/21/edit-files-as-root/
(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

; xml-format
(defun xml-format ()
  "Xml-format."
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t)
    )
  )

; https://stackoverflow.com/questions/6837511/automatically-disable-a-global-minor-mode-for-a-specific-major-mode
(defun my-inhibit-global-linum-mode ()
  "Counter-act `global-linum-mode'."
  (add-hook 'after-change-major-mode-hook
            (lambda () (linum-mode 0))
            :append :local))

;; Preset `linum-format' for minimum width.
;; https://www.emacswiki.org/emacs/LineNumbers
(defun my-linum-mode-hook ()
  (when linum-mode
    (setq-local linum-format
                (concat " %" (number-to-string
                             ;; Guesstimate number of buffer lines.
                             (ceiling (log (max 1 (/ (buffer-size) 80)) 10)))
                        "d "))))


;; https://stackoverflow.com/questions/31443527/how-can-i-make-flycheck-use-virtualenv/31456619#31456619
(defun set-flychecker-executables ()
  "Configure virtualenv for flake8 and lint."
  (when (get-current-buffer-flake8)
    (flycheck-set-checker-executable (quote python-flake8)
                                     (get-current-buffer-flake8)))
  (when (get-current-buffer-pylint)
    (flycheck-set-checker-executable (quote python-pylint)
                                     (get-current-buffer-pylint))))

(provide 'functions)
;;; functions.el ends here
