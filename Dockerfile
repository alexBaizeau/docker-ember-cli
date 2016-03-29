FROM node:5.8

# Originally from Dan Lynn <docker@danlynn.org>

RUN npm set progress=false
RUN npm install -g ember-cli@2.4.2 bower@1.7.7 phantomjs-prebuilt@2.1.5

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
