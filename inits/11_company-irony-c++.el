(require 'irony)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-to-list 'company-backends 'company-irony) ; backend追加

;; デフォルトのビルド・オプション
(setq irony-lang-compile-option-alist
      '((c++-mode . ("c++" "-std=c++11" "-lstdc++" "-lm"))
        (c-mode . ("c"))
        (objc-mode . '("objective-c"))))

(defun ad-irony--lang-compile-option ()
  (defvar irony-lang-compile-option-alist)
  (let ((it (cdr-safe (assq major-mode irony-lang-compile-option-alist))))
    (when it (append '("-x") (split-string it "\s")))))
(advice-add 'irony--lang-compile-option :override #'ad-irony--lang-compile-option)

;; (24.3以前 旧アドバイス使用)
;;(defadvice irony--lang-compile-option (around ad-irony--lang-compile-option activate)
;;  (defvar irony-lang-compile-option-alist)
;;  (let ((it (cdr-safe (assq major-mode irony-lang-compile-option-alist))))
;;    (when it (append '("-x") (split-string it "\s")))))
