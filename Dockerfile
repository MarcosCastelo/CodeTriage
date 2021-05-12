FROM ruby:2.7.3 

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update
RUN apt install -y libpq-dev yarn

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install
COPY package.json yarn.lock ./

COPY . ./
