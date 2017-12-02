;;; 各パッケージの設定ファイル格納先を設定
(defconst system-inits-dir (concat user-emacs-directory "inits"))
;;; リポジトリ変数
(defvar melpa-repo-url "http://melpa.milkbox.net/packages/")
(defvar marmalade-repo-url "http://marmalade-repo.org/packages/")
(defvar repository-list
  '(
    init-loader
    company
    irony
    company-irony
    counsel ;; Ivy/Counsel
    dired-toggle
    dired-details
    dired-subtree
    redo+
    highlight-symbol
    )
  "使用パッケージ一覧")

(if (>= emacs-major-version 24)
    (setq repository-list
          (append repository-list
                  '(helm
                    helm-swoop
                    helm-ag
                    )))
  (setq repository-list
        (append repository-list
                '(ivy
                  ))))

;;; リポジトリ先
(require 'package)
(add-to-list 'package-archives (cons "melpa" melpa-repo-url))
(add-to-list 'package-archives (cons "marmalade" marmalade-repo-url))
(package-initialize)

;;; 未インストールパッケージの自動インストール
(require 'cl)
(let ((not-installed
       (loop for x in repository-list
             when (not (package-installed-p x)) collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist
        (pkg not-installed)
        (package-install pkg))))

;;; ファイル命名規則が存在する
;例 : xx-hoge.el, xx -> 00 ~ 99
(when (require 'init-loader nil t)
  (setq init-loader-show-log-after-init 'error-only)
  (when (file-directory-p (symbol-value 'system-inits-dir))
    (init-loader-load system-inits-dir)))
