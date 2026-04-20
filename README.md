🥚 Easter Hunt API

A REST API built with Ruby on Rails for managing an Easter Hunt game.

The system provides two main roles:
 - Hunter — players who search for Easter eggs
 - Admin — administrators who manage eggs

Getting Started

Required:
 - rails 8.1.3
 - ruby 4.0.1

Installation
 - bundle install

Setup Database
 - rails db:create db:migrate db:seed

Run Server
 - bin/dev

Server will be available at:
 - http://localhost:3000

Hunter API:
  Signup
  POST /api/v1/hunter/signup
  Body:
    {
      "email": "hunter@mail.com",
      "password": "password"
    }

  Login
  POST /api/v1/hunter/login
  Body:
    {
      "email": "hunter@mail.com",
      "password": "password"
    }

  Google OAuth
  POST /api/v1/hunter/oauth/google
  Body:
    {
      "token": "google_oauth_token"
    }

Easter Eggs API:
  Get Found Eggs
  GET /api/v1/hunter/easter_eggs/found

  Get Not Found Eggs
  GET /api/v1/hunter/easter_eggs/not_found

  Mark Egg as Found
  PATCH /api/v1/hunter/easter_eggs/mark_found
  Body:
    {
      "code": "code"
    }

Admin API
  Admin Login
  POST /api/v1/admin/login
  Body:
    {
      "email": "hunter@mail.com",
      "password": "password"
    }

  List Easter Eggs
  GET /api/v1/admin/easter_eggs
  Body:
    {}

  List with filter Easter Eggs
  GET /api/v1/admin/easter_eggs
  Body:
    {
      "status": "not_found/found",
      "hunter_email": "hunter_email"
    }

  Create Easter Egg
  POST /api/v1/admin/easter_eggs
  Body:
    {
      "latitude": 50.45,
      "longitude": 30.52,
      "clue": "clue"
    }

  Update Easter Egg
  PUT /api/v1/admin/easter_eggs/:id
  Body:
    {
      "latitude": 45.55,
      "longitude": 31.52,
      "clue": "clue"
    }
