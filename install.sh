#! /bin/zsh
# デフォルトの保存先ディレクトリ
DEFAULT_DIR="$HOME/.local/bin/nlpzoom"

# 入力プロンプト
echo -n "保存先ディレクトリを入力してください（Enterでデフォルト: $DEFAULT_DIR）: "
read -r input_dir

# 入力が空ならデフォルトディレクトリを使う
if [ -z "$input_dir" ]; then
    save_dir="$DEFAULT_DIR"
else
    # ディレクトリが存在するか確認
    if [ -d "$input_dir" ]; then
        save_dir="$input_dir"
    else
        echo "❌ エラー: ディレクトリ '$input_dir' は存在しません。" >&2
        exit 1
    fi
fi

# 保存用ファイル名

# 保存ディレクトリがなければ作成（オプション）
mkdir -p "$save_dir"

curl -fsSL "https://raw.githubusercontent.com/fuji029/nlpzoom/refs/heads/main/script/open.sh" -o "$save_dir/nlpzoom"

chmod 755 $save_dir/nlpzoom
touch $save_dir/.env

if ! echo "$PATH" | grep -q "$save_dir"; then
    echo "export PATH=\"$save_dir:\$PATH\"" >> "$HOME/.zshrc"
    echo "\"source ~/.zshrc\"を実行してください．"
fi

echo "✅Install Completed!"