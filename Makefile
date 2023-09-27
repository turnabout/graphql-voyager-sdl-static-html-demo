NODE_JS_DOCKER_RUN := @docker run -it --name voyager-node --network host --rm --volume $(PWD):/app --workdir /app node:18.10-alpine

set-up:
	@echo "Installing dependencies"
	$(NODE_JS_DOCKER_RUN) \
		npm install

browserify:
	@echo "Generating 'graphql.bundle.js' file"
	$(NODE_JS_DOCKER_RUN) \
		npx browserify graphql.js \
			--outfile graphql.bundle.js \
			--transform [ babelify --presets [ @babel/preset-env ] ]

serve:
	@echo "Service Voyager page on http://localhost:8080"
	@docker run \
		-it \
		--name voyager \
		--publish 8080:8080 \
		--rm \
		--volume $(PWD):/var/www \
			trinitronx/python-simplehttpserver
