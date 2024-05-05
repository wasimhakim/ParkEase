FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/www/parkease
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

#DB ARG

ARG DB_PASSWD

ARG ENV_RAILS

ENV EMERALDS_API_DATABASE_PASSWORD=${DB_PASSWD}
# Setting env up
ENV RAILS_ENV=${ENV_RAILS}
ENV RACK_ENV=${ENV_RAILS}

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs 20 --retry 5 --without development test

# Adding project files
COPY . .
RUN bundle exec rake assets:precompile

RUN ln -sf /dev/stdout /var/www/parkease/log/production.log

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
