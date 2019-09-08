FROM ruby:2.5.3-alpine

WORKDIR /usr/src/app/

COPY Gemfile* /usr/src/app/

RUN apk add --no-cache \
           nodejs \
           postgresql \
           tzdata

RUN gem install bundler

RUN gem install tzinfo tzinfo-data --no-document

RUN bundle install

COPY . /usr/src/app/

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD puma
