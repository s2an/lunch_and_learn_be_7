# README

## Welcome to Lunch & Learn!

This Rails 7app users looking to explore recipes and learning resources based on different countries. 

### Objectives

Provides users with recipes and educational resources to many, many countries!
Supports user registration and login functionality!
Delivers an efficient back-end for front-end teams!

## Setup

* Ruby
* Rails 7
* PostgreSQL

### Clone the repo

`git clone https://github.com/s2an/lunch_and_learn_be_7.git`

### Run these terminal commands

`cd lunch_and_learn_be_7`
`bundle install`
`rails db:create db:migrate`
`rails server`

## API Keys? You bet!
_Links not provided at this time, sorry!_

* Pexels for high-quality images. Get your API key at Pexels API. 
* REST Countries for country data. No API key required. REST Countries API.
* YouTube for video resources. Get your API key via Google Cloud Console.
* Edamam for recipe searches. Sign up for an API key at Edamam API Developer Portal.

## Endpoints

__Get Recipes For A Particular Country!__
* GET /api/v1/recipes?country=country_name

__Get Learning Resources for a Particular Country!__
* GET /api/v1/learning_resources?country=country_name

__User Registration!__
* POST /api/v1/users

__Log In to your very own Session!__
* POST /api/v1/sessions

__Tag your Favorites!__
* _TBD_

## Contributing

We welcome contributions! (Primarily in tips & tricks!)