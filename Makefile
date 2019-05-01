image:
	@docker build \
		--tag zephinzer/jekyll:latest \
		.

start: image
	@if [ "${NAME}" = "" ]; then echo "\nerr: a \$$NAME needs to be specified\n"; exit 1; fi;
	@mkdir -p $$(pwd)/cache/tmp/bundler/home/unknown;
	@mkdir -p $$(pwd)/cache/usr/local/bundler/cache;
	@mkdir -p $$(pwd)/themes;
	@if [ -f "$$(pwd)/themes/${NAME}/Gemfile" ]; then \
		docker run \
			-it \
			--publish 4000:4000 \
			--publish 4001:4001 \
			--user $$(id -u) \
			--volume "$$(pwd)/themes/${NAME}:/theme" \
			--volume "$$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" \
			--volume "$$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" \
			--workdir /theme \
			zephinzer/jekyll:latest; \
	else \
		docker run \
			-it \
			--entrypoint "jekyll" \
			--user $$(id -u) \
			--volume "$$(pwd)/themes:/theme" \
			--volume "$$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" \
			--volume "$$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" \
			--workdir /theme \
			zephinzer/jekyll:latest \
			new ${NAME}; \
	fi
