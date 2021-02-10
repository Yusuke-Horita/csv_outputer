FROM ruby:2.5.7

RUN apt-get update -qq && \
apt-get install -y build-essential \
									 libpq-dev \
									 nodejs \
									 default-mysql-client \
									 vim

RUN mkdir /csv_outputer

WORKDIR /csv_outputer

COPY Gemfile /csv_outputer/Gemfile
COPY Gemfile.lock /csv_outputer/Gemfile.lock

RUN bundle install

COPY . /csv_outputer