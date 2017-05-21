# これは？
Emacs25での設定スクリプト

# 使い方
$HOME/.emacs.dの名前でgit clone

# 構成
スクリプトロードにinit-loaderプラグインを使用。
initsディレクトリ内にすべてのスクリプトファイルを配置。
00～99の番号順にスクリプトを自動ロードする。
番号設定は、inits/info.txtに記載

プラグインに依存するキーマップはそれぞれの設定ファイルに記述
emacs自体のキーマップは、99番に記述

# 使用プラグイン
- helm
- ivy / counsel
- dired-details
- dired-subtree
- dired-toggle
- irony
- company-irony
- redo+
- highlight-symbol

