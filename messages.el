;;; -*- lexical-binding: t; -*-
;;; package --- Summary
;;; Commentary:
;;; Code:
;;; timestamps in *Messages*
;;; Taken from https://www.reddit.com/r/emacs/comments/2094tl/how_can_i_improve_emacs_performance/cg0ydzc/

(defun current-time-microseconds ()
  (let* ((nowtime (current-time))
         (now-ms (nth 2 nowtime)))
    (concat (format-time-string "[%Y-%m-%dT%T" nowtime) (format ".%d] " now-ms))))

(defadvice message (before test-symbol activate)
  (if (not (string-equal (ad-get-arg 0) "%s%s"))
      (let ((deactivate-mark nil)
            (inhibit-read-only t))
        (save-excursion
          (set-buffer "*Messages*")
          (goto-char (point-max))
          (if (not (bolp))
              (newline))
          (insert (current-time-microseconds))))))

(provide 'messages)
;;; messages.el ends here
