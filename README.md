# Attensi European Championship Game App README

This repository is an assignment for Attensi.

## Basic setup includes
- Rails version: 6.1.3.2
- Ruby version: 2.6.7
- postgresql database

This is an API-only app.

## Setup locally:

- clone project
```bash
$ git clone https://github.com/annehoogerbrugge/attensi-ec-game.git
$ bundle install
```
- setup the database

```bash
$ bundle exec rails db:setup
$ bundle exec rails db:seed
```

## Swagger API docs

The api can be tested through the Swagger UI.

To fill the swagger.json file run: `rake rswag:specs:swaggerize`

Then you can access a local instance of the Swagger docs via: `http://localhost:3000/api-docs`

## Running Tests

Run the test suite with rspec, run `bundle exec rspec`
