# docker-fbx-sdk-python-nodejs

<div style="text-align:right">Language: <a href="https://github.com/segurvita/docker-fbx-sdk-python-nodejs/blob/master/README.md">English</a> | <i>日本語</i></div>
Node.jsからFBX SDK Pythonを実行するDockerイメージです。

Docker Hubに公開しています。
https://hub.docker.com/r/seguropus/fbx-sdk-python-nodejs

技術的なことはQiitaに記事を書いていますので、詳しくはこちらをご覧ください。
https://qiita.com/segur/items/5d068661b12a1e7717d2




# GitHubのサンプルコードの使い方
```bash
# Dockerイメージを作る
docker-compose build

# Dockerコンテナーを起動する
docker-compose up
```

FBX SDKが読み込めるファイル形式の一覧が表示されます。



# Dockerイメージの使い方

```bash
# Docker Hubからダウンロードする
docker pull seguropus/fbx-sdk-python-nodejs:latest

# Dockerコンテナーを起動する
docker run -it seguropus/fbx-sdk-python-nodejs:latest /bin/ash
```



## PythonからFBX SDKを呼ぶ方法

DockerイメージにはFBX SDKがすでにインストールされています。以下のようにお使いください。

```python:main.py
from fbx import *
manager = FbxManager.Create()
```



## Node.jsからPythonを呼ぶ方法

Dockerイメージには `python-shell` がすでにインストールされています。以下のようにお使いください。

```javascript:index.js
const pythonShell = require('python-shell');
const pyOption = {
    pythonPath: '/usr/local/bin/python',
}
const pyShell = new pythonShell.PythonShell('main.py', pyOption);
pyShell.on('message', (message) => {
    console.log(message);
});
```



# ライセンス

FBX SDK PythonはAutodesk Licenseの下にあります。（[License.txt](https://github.com/segurvita/docker-fbx-sdk-python-nodejs/blob/master/License.txt)を参照）
