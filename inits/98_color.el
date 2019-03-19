;; ベースのカラースキーム
(load-theme 'wombat)

;; 独自設定
(custom-set-faces
 '(cursor ;; カーソル自体の色
   ((((class color)(background dark))
     (:background "white"))
    (((class color)(background light))
     (:background "black"))))
 '(hl-line ;; 現在行の色
   ((t (:box (:line-width 1 :color "dim gray")))))
 '(region ;; 選択範囲の色
   ((t (:background "medium blue"))))
 '(which-func ;; モードラインの関数名
   ((t (:foreground "light green" :slant italic :weight bold))))
 '(isearch ;; 検索結果
   ((t (:background "yellow4" :foreground "black"))))
 )

(set-face-attribute
 'linum nil :foreground "yellow"
 )
