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
   ((t (:background "black"))))
 '(region ;; 選択範囲の色
   ((t (:background "dark blue"))))
 '(which-func ;; モードラインの関数名
   ((t (:foreground "light green" :slant italic :weight bold))))
 )

(set-face-attribute
 'linum nil :foreground "yellow"
 )
