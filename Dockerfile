FROM ruby:3.2-alpine

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

CMD ["ruby", "app.rb"]
