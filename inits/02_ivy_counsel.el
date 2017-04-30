(require 'ivy)
(ivy-mode 0)

;(global-set-key (kbd "C-s") (lambda ()
;                              (interactive)
;                              (swiper (cond
;                                       ;; If there is selection use it
;                                       ((and transient-mark-mode mark-active (not (eq (mark) (point))))
;                                        (buffer-substring-no-properties (mark) (point)))
;                                       ;; Otherwise, use symbol at point or empty
;                                       (t (format "%s" ""))))))
