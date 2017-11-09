(require 'helm)
(require 'helm-ag)
(require 'helm-config)
(require 'helm-swoop)

;; キーバインド
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
;; 上書き
(global-set-key (kbd "M-x") 'helm-M-x) ; helmのコマンドラインを起動
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
;; helm-ag用
(global-set-key (kbd "C-x C-g") 'helm-ag-this-file)
(global-set-key (kbd "C-x C-S-g") 'helm-ag)
;; helm-swoop用
(global-set-key (kbd "C-s") 'helm-swoop)
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
;; ヘルムマップ用
(define-key helm-map (kbd "C-z")  'helm-select-action) ; デフォルトのTABとC-zを交換
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; ターミナル内のTABと同じ挙動

;; curl実行時の動作
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

;; 基本設定
(setq helm-split-window-in-side-p           t ; 現在のウィンドウ内にヘルム用バッファを展開
      helm-move-to-line-cycle-in-source     t ; 選択肢の移動をサイクリックする
      helm-ff-search-library-in-sexp        t ; `require'と`declare-function'のライブラリをsexpで検索
      helm-scroll-amount                    8 ; M-<next>/M-<prior>でスクロールする量
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

;; ファジー検索機能を有効化
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

;; ヘルムバッファのりサイズ機能を有効化
(setq helm-autoresize-max-height 0
      helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

;; ヘルムモードを有効化
(helm-mode 1)
