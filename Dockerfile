FROM node:0.10.36

# Originally from Dan Lynn <docker@danlynn.org>

# Note: npm is v2.5.0
RUN npm install -g ember-cli@1.13.13 bower@1.3.12 phantomjs@1.9.15 npm-cache

WORKDIR /usr/src/app
ENTRYPOINT ["/usr/src/app/node_modules/ember-cli/bin/ember"]
CMD ["help"]
