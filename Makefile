image:
	@docker build \
		--tag zephinzer/jekyll:latest \
		.

image_publish: image
	@docker push zephinzer/jekyll:latest
	@docker tag zephinzer/jekyll:latest zephinzer/jekyll:$$(docker run -it --entrypoint "/version" zephinzer/jekyll:latest)
	@docker push zephinzer/jekyll:$$(docker run -it --entrypoint "/version" zephinzer/jekyll:latest)
	@docker tag zephinzer/jekyll:latest zephinzer/jekyll:$$(docker run -it --entrypoint "jekyll" zephinzer/jekyll:latest --version | cut -f 2 -d ' ' | tr -d '[:space:]')
	@docker push zephinzer/jekyll:$$(docker run -it --entrypoint "jekyll" zephinzer/jekyll:latest --version | cut -f 2 -d ' ' | tr -d '[:space:]')

clean_eg:
	@rm -rf ./example/*

eg_version:
	$(MAKE) _eg_base cmd=version

eg_init:
	$(MAKE) _eg_base cmd=init

eg_init_site:
	$(MAKE) _eg_base cmd=init-site

eg_init_theme:
	$(MAKE) _eg_base cmd=init-theme

eg_serve:
	$(MAKE) _eg_base cmd=serve

eg_help:
	$(MAKE) _eg_base cmd=help

_eg_base:
	@if [ "${cmd}" = "" ]; then echo "\nerr: you need to specify a \$$cmd variable\n"; exit 1; fi;
	@mkdir -p \
		$$(pwd)/cache/tmp/bundler/home/unknown \
		$$(pwd)/cache/usr/local/bundler/cache
	docker run -it \
		--publish 4000:4000 \
		--publish 4001:4001 \
		--user $$(id -u) \
		--volume "$$(pwd)/example:/jekyll" \
		--volume "$$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" \
		--volume "$$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" \
		zephinzer/jekyll:latest ${cmd}
