;;表示系の設定
;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
	  (format "%%f - Emacs@%s" (system-name)))
;;(menu-bar-mode -1)  ;; メニューバー非表示
(tool-bar-mode 0)     ;; ツールバー非表示
(fset 'yes-or-no-p 'y-or-n-p)      ;; "yes or no" -> "y or n"

;; 行数設定
(cond
 ((window-system)        ;; GUI起動時
  (global-linum-mode t)  ;; 行番号表示
  (setq linum-format "%4d"))
 ((not window-system)    ;; CUI起動時
  (global-linum-mode t)  ;; 行版業表示
  (setq linum-format "%4d|"))
 )

;; 括弧の範囲内を強調表示
(show-paren-mode t)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)

;; カーソル系
(setq default-cursor-type 'bar)
(global-hl-line-mode t) ;; カーソル行のハイライトを有効化

;; ステータスバー系
;; 改行コードを表示する
(setq eol-mnemonic-dos "(CRLF)"
      eol-mnemonic-mac "(CR)"
      eol-mnemonic-unix "(LF)")
