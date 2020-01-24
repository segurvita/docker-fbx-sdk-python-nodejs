# docker-fbx-sdk-python-nodejs

<div style="text-align:right">Language: <i>English</i> | <a href="README_JA.md">日本語</a></div>

A container to run FBX SDK Python with Node.js



# How to use sample code of GitHub
```bash
# Make docker image
docker-compose build

# Execute docker container
docker-compose up
```

You can get list of file formats which FBX SDK can read.



# How to use docker image

```bash
# download from docker hub
docker pull seguropus/fbx-sdk-python-nodejs:latest

# execute container
docker run -it seguropus/fbx-sdk-python-nodejs:latest /bin/ash
```



## How to use FBX SDK from Python

FBX SDK has been already installed in the docker image. You can use like below.

```python:main.py
from fbx import *
manager = FbxManager.Create()
```



## How to use Python from Node.js

`python-shell` has been already installed in the docker image. You can use like below.

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



# Licensing

The FBX SDK Python is under Autodesk License (see [License.txt](./License.txt))
