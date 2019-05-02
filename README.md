# Jekyll Image
A Docker image containing Jekyll for development of themes.

- [Jekyll Image](#jekyll-image)
- [Usage](#usage)
  - [Pre-Usage](#pre-usage)
  - [Serving a Jekyll blog](#serving-a-jekyll-blog)
  - [Creating a new theme](#creating-a-new-theme)
  - [Creating a new site](#creating-a-new-site)
  - [Creating a new site with a blank theme](#creating-a-new-site-with-a-blank-theme)
- [License](#license)

# Usage

## Pre-Usage
You'll need to create two directories from your current directory. This is because we do not wish to run as the `root` user in the image, and we'd like to cache any gems we are using:

```sh
mkdir -p ./cache/tmp/bundler/home/unknown;
mkdir -p ./cache/usr/local/bundler/cache;
```

## Serving a Jekyll blog

```sh
docker run -it \
  --user $(id -u) \
  --volume "$(pwd):/jekyll" \
  --volume "$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" \
  --volume "$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" \
  zephinzer/jekyll:latest serve;
```

To use as an alias:

```sh
alias jkserve='docker run -it -u $(id -u) -v "$(pwd):/jekyll" -v "$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" -v "$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" zephinzer/jekyll:latest serve';
```

## Creating a new theme

```sh
docker run -it \
  --user $(id -u) \
  --volume "$(pwd):/jekyll" \
  --volume "$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" \
  --volume "$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" \
  zephinzer/jekyll:latest init-theme;
```

To use as an alias:

```sh
alias jkinitt='docker run -it -u $(id -u) -v "$(pwd):/jekyll" -v "$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" -v "$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" zephinzer/jekyll:latest init-theme';
```

## Creating a new site

```sh
docker run -it \
  --user $(id -u) \
  --volume "$(pwd):/jekyll" \
  --volume "$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" \
  --volume "$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" \
  zephinzer/jekyll:latest init-site;
```

To use as an alias:

```sh
alias jkinits='docker run -it -u $(id -u) -v "$(pwd):/jekyll" -v "$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" -v "$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" zephinzer/jekyll:latest init-site';
```

## Creating a new site with a blank theme

```sh
docker run -it \
  --user $(id -u) \
  --volume "$(pwd):/jekyll" \
  --volume "$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" \
  --volume "$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" \
  zephinzer/jekyll:latest init;
```

> With the above command, you'll need to fix the `TODO`s and `FIXME`s that come from the blank theme.

To use as an alias:

```sh
alias jkinit='docker run -it -u $(id -u) -v "$(pwd):/jekyll" -v "$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" -v "$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" zephinzer/jekyll:latest init';
```

# License
This project is licensed under the MIT license. See [the LICENSE file](./LICENSE) for the full text.
