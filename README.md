# Jekyll Image
A Docker image containing Jekyll for development of themes.

# Usage

## Assumptions

- Your theme under development will be stored at `./themes/${THEME_NAME}`

## Pre-Usage
You'll need to create two directories from your current directory. This is because we do not wish to run as the `root` user in the image, and we'd like to cache any gems we are using:

```sh
mkdir -p ./cache/tmp/bundler/home/unknown;
mkdir -p ./cache/usr/local/bundler/cache;
mkdir -p ./themes;
```

> The last directory is for storing your themes being worked on. You can use Git submodules to manage them!

Also, you should add the `./cache` to the `.gitignore` file if you're intending to check it into version control.

## Creating a new theme

```sh
THEME_NAME=new_theme \
  docker run -it \
    --entrypoint "jekyll" \
    --user $(id -u) \
    --volume "$(pwd)/themes:/theme" \
    --volume "$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" \
    --volume "$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" \
    --workdir /theme \
    zephinzer/jekyll:latest \
    new ${THEME_NAME}; \
```

## Working on an existing theme

```sh
THEME_NAME=new_theme \
  docker run -it \
    --network host \
    --user $(id -u) \
    --volume "$(pwd)/themes/${THEME_NAME}:/theme" \
    --volume "$(pwd)/cache/tmp/bundler/home/unknown:/tmp/bundler/home/unknown" \
    --volume "$(pwd)/cache/usr/local/bundler/cache:/usr/local/bundler/cache/" \
    --workdir /theme \
    zephinzer/jekyll:latest;
```

# License
This project is licensed under the MIT license. See [the LICENSE file](./LICENSE) for the full text.
