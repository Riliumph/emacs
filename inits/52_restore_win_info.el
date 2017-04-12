;; フレームサイズと位置を記憶
(defconst restore-info-file "~/.local/cache/.emacs_win_info")

(defun save-window-info ()
  (let* ((rlist (frame-parameters (selected-frame)))
         (ilist initial-frame-alist)
         (nCHeight (frame-height))
         (nCWidth (frame-width))
         (tMargin (if (integerp (cdr (assoc 'top rlist)))
                      (cdr (assoc 'top rlist)) 0))
         (lMargin (if (integerp (cdr (assoc 'left rlist)))
                      (cdr (assoc 'left rlist)) 0))
         buf
         (file restore-info-file))
    (when (file-writable-p file)
      (with-temp-buffer
        (erase-buffer)
        (insert (concat
                 "(delete 'width initial-frame-alist)\n"
                 "(delete 'height initial-frame-alist)\n"
                 "(delete 'top initial-frame-alist)\n"
                 "(delete 'left initial-frame-alist)\n"
                 "(setq initial-frame-alist (append (list\n"
                 "'(width . " (int-to-string nCWidth) ")\n"
                 "'(height . " (int-to-string nCHeight) ")\n"
                 "'(top . " (int-to-string tMargin) ")\n"
                 "'(left . " (int-to-string lMargin) "))\n"
                 "initial-frame-alist))\n"
                 ;;"(setq default-frame-alist initial-frame-alist)"
                 ))
        (write-region (point-min) (point-max) file)
        ))))

(defun load-window-info ()
  (let* ((file restore-info-file))
    (if (file-exists-p file)
        (load-library file))))

;; Call the function above at C-x C-c.
(defadvice save-buffers-kill-emacs
    (before save-frame-size activate)
  (save-window-info))

(load-window-info)
