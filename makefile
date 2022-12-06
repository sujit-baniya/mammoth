.PHONY: test mammoth-plus.browser.js npm-install

test:
	npm test

setup: npm-install mammoth-plus.browser.min.js

npm-install:
	npm install

mammoth-plus.browser.js:
	node_modules/.bin/browserify lib/index.js --standalone mammoth-plus -p browserify-prepend-licenses > $@

mammoth-plus.browser.min.js: mammoth-plus.browser.js
	node_modules/.bin/uglifyjs mammoth-plus.browser.js -c > $@
