FROM ruby:2.6.5-alpine3.11

RUN apk add --update bash \
  mysql-client \
  build-base \
  pcre-dev \
  ruby-dev \
  mariadb-dev \
  ruby-nokogiri \
  nodejs-current \
  python2 \
  yaml \
  ruby-json \
  tzdata \
  yarn && \
  rm -rf /var/cache/apk/*

ADD Gemfile* ./
ADD package.json ./

RUN gem install bundler -v 1.17.3

RUN bundle install --jobs=`expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3
RUN yarn && yarn cache clean
