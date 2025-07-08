# Dockerfile
FROM ruby:3.2.2

WORKDIR /usr/src/app

# Install dependencies needed by gems
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm

# Copy the Gemfile and install gems. This is the key step.
# This layer is cached, so it only runs when you change your Gemfile.
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of your app's code
COPY . .