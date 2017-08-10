FROM node:6.10

# Originally from Dan Lynn <docker@danlynn.org>

RUN npm set progress=false
RUN npm install -g ember-cli@2.14.1 bower@1.8.0 phantomjs-prebuilt@2.1.14

# install yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 0.27.5
ENV PATH "$PATH:/root/.yarn/bin"

# install google-chrome
RUN \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable && \
  rm -rf /var/lib/apt/lists/*


# install watchman
RUN \
  git clone https://github.com/facebook/watchman.git &&\
  cd watchman &&\
  git checkout v3.5.0 &&\
  ./autogen.sh &&\
  ./configure &&\
  make &&\
  make install

WORKDIR /usr/src/app
ENTRYPOINT ["/usr/src/app/node_modules/ember-cli/bin/ember"]
CMD ["help"]
