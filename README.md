# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Create postgres with docker
docker run --name my-docker-postgres -p 5432:5432 -e POSTGRES_PASSWORD=password -d postgres:14.5
