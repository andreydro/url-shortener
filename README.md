# Intial Setup

    docker-compose build
    docker-compose up mariadb
    docker-compose run short-app rails db:migrate
    docker-compose -f docker-compose-test.yml build

# To run migrations

    docker-compose run short-app rails db:migrate
    docker-compose -f docker-compose-test.yml run short-app-rspec rails db:test:prepare

# To run the specs

    docker-compose -f docker-compose-test.yml run short-app-rspec

# Run the web server

    docker-compose up

# Adding a URL

    curl -X POST -d "full_url=https://google.com" http://localhost:3000/short_urls.json

# Getting the top 100

    curl localhost:3000

# Checking your short URL redirect

    curl -I localhost:3000/abc

# Information about algorithm to shorten the URL
  - You can find algorithm to shorten the URL in ShortCodeGenerator service.
  - It checks number of existing codes and compare it with possible combinations:

      - If number of existing codes is less then possible combination for current length, it generates code with current length

      - If number of existing code is more then possible combination for current length, it generates code with next next value of length

-   Also, it has a check for existing code: if such code exists, it generates new codes until find a free code
