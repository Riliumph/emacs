(require 'highlight-symbol)
;; 自動ハイライトを有効化
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
;; M-p/M-nによるシンボル間移動を有効化
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
;; n秒後にハイライトを有効化
(setq highlight-symbol-idle-delay 0.1)
;; キーマップ設定
(global-set-key [f1] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;;;;; 背景色設定
;; 自動ハイライト色（紫）
(custom-set-faces
  '(highlight-symbol-face ((t (:background "dark magenta"))))

;; 背景色リスト
(setq highlight-symbol-colors
      '(
        "#af0000" ;; RED
        "#d75f00" ;; ORANGE (Used searched word)
        "#00afff" ;; BLUE
        "#5fffff" ;; AQUA
        "#00d700" ;; GREEN
        "#00ff5f" ;; Lime
        "#875fd7" ;; PURPLE
        ))
