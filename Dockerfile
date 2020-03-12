FROM ruby:2.6.5-alpine3.11

RUN apk add --update bash \
  ruby-dev \
  build-base \
  pcre-dev \
  mysql-client \
  mariadb-dev \
  ruby-nokogiri \
  nodejs-current \
  python2 \
  tzdata \
  yarn && \
  rm -rf /var/cache/apk/*

ADD Gemfile* ./
ADD package.json ./

RUN yarn install
RUN bundle install
