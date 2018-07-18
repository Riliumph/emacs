;; 基本はCUAに合わせる
(custom-set-variables'
 (cua-mode t nil (cua-base)))

;; CUAキーマップ
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)
(global-set-key (kbd "C-v") 'clipboard-yank)
(global-set-key (kbd "C-a") 'mark-whole-buffer)


;; ウィンドウ移動系キーマップ
;; vim likeなキーマップ
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <right>") 'windmove-right)

;; @param 移動量指定
(defun other-window-or-split (val)
  "ウィンドウの移動・分割関数"
  "ウィンドウが単一のときは縦分割し、複数のときは指定分移動する"
  (interactive)
  (when (one-window-p)
    ;;(split-window-horizontally);;split horizontally
    (split-window-vertically))   ;;split vertically
  (other-window val))

(global-set-key (kbd "<C-tab>")
                (lambda () (interactive)
                  (other-window-or-split 1)))  ;; 次のウィンドウに移動
(global-set-key (kbd "<C-S-iso-lefttab>")
                (lambda () (interactive)
                  (other-window-or-split -1))) ;; 前のウィンドウに移動
