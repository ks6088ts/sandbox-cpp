# VS Code 上の remote container で C++ 開発

1. VS Code 上で ```ctrl + shift + p``` でコマンドパレットを開く
2. Install Extensions から ```ms-vscode-remote.remote-containers``` をインストール
3. Reopen in Containers を選択
4. (初回のみ) From docker-compose.yml を選択

通常の開発では 1, 3 のみを実行すればよい。

# Clang-Format

```bash
# create .clang-format
clang-format --style=Google --dump-config > .clang-format

# run format
make fmt
```

# Clang

```bash
make build
```

# 参考

* [Developing inside a Container](https://code.visualstudio.com/docs/remote/containers)
* [Clang-Format Style Options](https://clang.llvm.org/docs/ClangFormat.html)
* [Attributes in Clang](https://clang.llvm.org/docs/ClangCommandLineReference.html)
