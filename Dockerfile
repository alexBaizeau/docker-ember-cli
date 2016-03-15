FROM node:4.2

# Originally from Dan Lynn <docker@danlynn.org>

# Note: npm is v2.14.x
RUN npm set progress=false
RUN npm install -g ember-cli@1.13.13 bower@1.3.12 phantomjs@2.1.1 npm-cache
RUN /usr/src/app/node_modules/ember-cli/bin/ember install ember-cli-deploy-s3

WORKDIR /usr/src/app
ENTRYPOINT ["/usr/src/app/node_modules/ember-cli/bin/ember"]
CMD ["help"]
