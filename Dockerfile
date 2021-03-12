FROM ruby:2.7.2

WORKDIR /var/www/catalog
COPY . .
RUN bundle install

EXPOSE 4567

CMD ["ruby", "initialize.rb", "web_api"]
