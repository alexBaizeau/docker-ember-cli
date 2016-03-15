FROM node:5.8

# Originally from Dan Lynn <docker@danlynn.org>

RUN npm set progress=false
RUN npm install -g ember-cli@2.4.2 bower@1.3.12 phantomjs-prebuilt@2.1.5 npm-cache
RUN /usr/src/app/node_modules/ember-cli/bin/ember install ember-cli-deploy-s3

WORKDIR /usr/src/app
ENTRYPOINT ["/usr/src/app/node_modules/ember-cli/bin/ember"]
CMD ["help"]
