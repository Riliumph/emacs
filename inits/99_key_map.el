;; 基本はCUAに合わせる
(custom-set-variables'
 (cua-mode t nil (cua-base)))

;; CUAキーマップ
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)
(global-set-key (kbd "C-v") 'clipboard-yank)
(global-set-key (kbd "C-a") 'mark-whole-buffer)

;; Ctrl + Tab / Ctrl + Shift + Tabで分割ウィンドウを移動
(defun other-window-or-split (val)
  (interactive)
  (when (one-window-p)
    ;;(split-window-horizontally);;split horizontally
    (split-window-vertically))   ;;split vertically
  (other-window val))

(global-set-key (kbd "<C-tab>")
		(lambda () (interactive)
		  (other-window-or-split 1)))
(global-set-key (kbd "<C-S-iso-lefttab>")
		(lambda () (interactive)
		  (other-window-or-split -1)))
