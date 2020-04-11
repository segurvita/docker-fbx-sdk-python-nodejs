# Alpine with Python 2.7 and Node.js 12
FROM nikolaik/python-nodejs:python2.7-nodejs12-alpine

# Install apk library
RUN apk update && \
    apk add \
    curl \
    libxml2 \
    libstdc++ \
    musl \
    linux-headers \
    gcc \
    g++ \
    make \
    gfortran \
    openblas-dev

# Download FBX SDK
RUN curl -L \
    https://damassets.autodesk.net/content/dam/autodesk/www/adn/fbx/20195/fbx20195_fbxpythonsdk_linux.tar.gz \
    -o /tmp/fbx20195_fbxpythonsdk_linux.tar.gz

# Make install directory
RUN mkdir -p /python-fbx/install

# Unzip FBX SDK
RUN tar -zxvf \
    /tmp/fbx20195_fbxpythonsdk_linux.tar.gz \
    -C /python-fbx && \
    printf "yes\nn" | \
    /python-fbx/fbx20195_fbxpythonsdk_linux \
    /python-fbx/install

# Install FBX SDK
RUN cp /python-fbx/install/lib/Python27_ucs4_x64/* \
    /usr/local/lib/python2.7/site-packages/

# Install python-shell
RUN npm install -g python-shell

# Delete tmp files
RUN rm -r /python-fbx
RUN rm /tmp/fbx20195_fbxpythonsdk_linux.tar.gz

# Set NODE_PATH
ENV NODE_PATH /usr/local/lib/node_modules

# Install Poetry
RUN curl -sSL \
    https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | \
    python

# Add to PATH
ENV PATH $PATH:/root/.poetry/bin

# Disable virtualenvs
RUN poetry config virtualenvs.create false
