FROM ruby:2.6.5-alpine3.11

RUN apk --update-cache add --virtual build-dependencies \
  build-base \
  pcre-dev \
  ruby-dev \
  mariadb-dev

RUN apk add --update bash \
  mysql-client \
  ruby-nokogiri \
  nodejs-current \
  python2 \
  yaml \
  ruby-json \
  tzdata \
  ca-certificates \
  yarn && \
  rm -rf /var/cache/apk/*

ADD Gemfile* ./
ADD package.json ./

RUN gem install bundler -v 1.17.3

RUN bundle install --jobs=`expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3
RUN yarn && yarn cache clean

RUN apk del build-dependencies
