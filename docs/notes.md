# VS Code 上の remote container で C++ 開発

1. VS Code 上で ```ctrl + shift + p``` でコマンドパレットを開く
2. Install Extensions から ```ms-vscode-remote.remote-containers``` をインストール
3. Reopen in Containers を選択
4. (初回のみ) From docker-compose.yml を選択

通常の開発では 1, 3 のみを実行すればよい。

## 参考
* [Developing inside a Container](https://code.visualstudio.com/docs/remote/containers)

# Clang-Format

```bash
# create .clang-format
clang-format --style=Google --dump-config > .clang-format

# run format
make fmt
```

## 参考
* [Clang-Format Style Options](https://clang.llvm.org/docs/ClangFormat.html)

# Clang

```bash
make build
```

## 参考
* [Attributes in Clang](https://clang.llvm.org/docs/ClangCommandLineReference.html)

# GoogleTest

```bash
make gtest
```

## 参考
* [Build with CMake](https://github.com/google/googletest/blob/master/googletest/README.md#build-with-cmake)
* [Google Testを導入してみた](https://qiita.com/y-vectorfield/items/6238cfd2d9c34aefe364)

# GitHub Actions

## 参考
* [actions/checkout#usage](https://github.com/actions/checkout#usage)

# Misc

* [[Docker] build tzdata タイムゾーン選択回避方法(ubuntu)](https://sleepless-se.net/2018/07/31/docker-build-tzdata-ubuntu/)

# CMake
```bash
cd src
mkdir -p build
cd build
cmake ..
make
./hello_cmake
```
## 参考
* [CMake](https://cmake.org/download/)
* [ttroy50/cmake-examples](https://github.com/ttroy50/cmake-examples) を参考に実行しながら学ぶ
* VSCode Extension:
  * [CMake langage support for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=twxs.cmake)
  * [Extended CMake support in Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools)
