(require 'company)
;; 適用範囲設定
(global-company-mode 0) ;; 全バッファで無効
(add-hook 'prog-mode-hook 'company-mode) ;; プログラム系モードの時に有効化
(add-hook 'prog-mode-hook '(lambda()
                             (setq-local indent-tabs-mode nil ) ;; インデントにタブ使用を禁止
                             (setq-local tab-width 2)           ;; タブ幅２
                             ))
;; 挙動設定
(setq company-idle-delay 0.1 ;; 補完表示遅延
      company-minimum-prefix-length 1 ;; 補完開始入力文字数
      company-selection-wrap-around t ;; リスト内の循環移動を有効化
      )
;; キーマップ
(global-set-key (kbd "C-SPC") 'company-complete)
