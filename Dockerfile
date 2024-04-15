# Check for latest version here: https://hub.docker.com/_/buildpack-deps?tab=tags&page=1&name=buster&ordering=last_updated
# This is just a snapshot of buildpack-deps:buster that was last updated on 2019-12-28.
FROM judge0/buildpack-deps:buster-2019-12-28

# Check for latest version here: https://www.ruby-lang.org/en/downloads
ENV RUBY_VERSIONS \
      2.7.0
RUN set -xe && \
    for VERSION in $RUBY_VERSIONS; do \
      curl -fSsL "https://cache.ruby-lang.org/pub/ruby/${VERSION%.*}/ruby-$VERSION.tar.gz" -o /tmp/ruby-$VERSION.tar.gz && \
      mkdir /tmp/ruby-$VERSION && \
      tar -xf /tmp/ruby-$VERSION.tar.gz -C /tmp/ruby-$VERSION --strip-components=1 && \
      rm /tmp/ruby-$VERSION.tar.gz && \
      cd /tmp/ruby-$VERSION && \
      ./configure \
        --disable-install-doc \
        --prefix=/usr/local/ruby-$VERSION && \
      make -j$(nproc) && \
      make -j$(nproc) install && \
      rm -rf /tmp/*; \
    done

# Check for latest version here: https://nodejs.org/en
ENV NODE_VERSIONS \
      20.12.2
RUN set -xe && \
    for VERSION in $NODE_VERSIONS; do \
      curl -fSsL "https://nodejs.org/dist/v$VERSION/node-v$VERSION.tar.gz" -o /tmp/node-$VERSION.tar.gz && \
      mkdir /tmp/node-$VERSION && \
      tar -xf /tmp/node-$VERSION.tar.gz -C /tmp/node-$VERSION --strip-components=1 && \
      rm /tmp/node-$VERSION.tar.gz && \
      cd /tmp/node-$VERSION && \
      ./configure \
        --prefix=/usr/local/node-$VERSION && \
      make -j$(nproc) && \
      make -j$(nproc) install && \
      rm -rf /tmp/*; \
    done

# Check for latest version here: https://github.com/microsoft/TypeScript/releases
ENV TYPESCRIPT_VERSIONS \
      5.4.5
RUN set -xe && \
    curl -fSsL "https://deb.nodesource.com/setup_20.x" | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    for VERSION in $TYPESCRIPT_VERSIONS; do \
      npm install -g typescript@$VERSION; \
    done

RUN set -xe && \
    apt-get update && \
    apt-get install -y --no-install-recommends locales && \
    rm -rf /var/lib/apt/lists/* && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

RUN set -xe && \
    apt-get update && \
    apt-get install -y --no-install-recommends git libcap-dev && \
    rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/judge0/isolate.git /tmp/isolate && \
    cd /tmp/isolate && \
    git checkout ad39cc4d0fbb577fb545910095c9da5ef8fc9a1a && \
    make -j$(nproc) install && \
    rm -rf /tmp/*
ENV BOX_ROOT /var/local/lib/isolate

LABEL maintainer="kostyan <test123@gmail.com>"
LABEL version="2.2.8"
