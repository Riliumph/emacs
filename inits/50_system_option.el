;; 初期画面系
(setq inhibit-startup-message t    ;; 初期画面非表示
      initial-scratch-message "")  ;; スクラッチメッセージ非表示

;; バックアップファイル系
(setq make-backup-files nil        ;; バックアップファイル無効化
      delete-auto-save-files t)    ;; 自動保存ファイルの自動削除

(setq x-select-enable-clipboard t) ;; クリップボードを有効

;; スクロール系
(setq mouse-wheel-follow-mouse 't ;; マウス下のウィンドウをスクロール
      scroll-margin 3             ;; マージン量
      scroll-conservatively 1     ;; キーボードスクロール量
      mouse-wheel-scroll-amount '(1  ;; マウススクロール量
                                  ((shift) . 0.5)  ;; 半ページ
                                  ((control) . nil)
                                  ))
;; インデント系
(setq-default indent-tabs-mode nil ;; インデント無効
              tab-width 2)          ;; タブ幅２
