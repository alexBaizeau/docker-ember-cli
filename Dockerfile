FROM node:6.10

# Originally from Dan Lynn <docker@danlynn.org>

RUN npm set progress=false
RUN npm install -g ember-cli@2.11.1 bower@1.8.0 phantomjs-prebuilt@2.1.14

# install yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 0.23.3
ENV PATH "$PATH:/root/.yarn/bin"

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
