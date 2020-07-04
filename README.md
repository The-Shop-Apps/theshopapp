# The Shop App

<img src="https://images.emojiterra.com/google/android-nougat/512px/1f6cd.png" height="75" alt="railroad logo">

A Ruby on Rails 6.0 Shopify App template for fast development. The out of the box shopify_app is great gem for helping you get setup quickly. But this template goes one step further!

The template has a full marketing site setup (StaticController) and Shopify embedded app setup once a Shop has been authenticated within Shopify.

The idea behind the template is faster === better. That's the reason this template uses things like Bootstrap, jQuery and RailsAdmin. The faster you can work on your actual app, the better. 

The application is optimized for Heroku deployments so setup includes use of PostgreSQL database, Figaro for storing environment variables, processing background jobs using Redis + Sidekiq and more.

## Utilizes
* Rails 6.0
* Ruby 2.7.1
* Puma Webserver
* PostgreSQL database - ready for Heroku
* Redis
* Includes Webpack

## Includes
* shopify_app - Shopify Application Rails engine and generator
* shopify_api - Shopify API Ruby gem
* SCSS + [Bootstrap](https://github.com/twbs/bootstrap-rubygem)(v4.0)
* [jQuery](https://github.com/rails/jquery-rails) (v3.5.1)
  * *optional - setup available for React or any other modern front-end framework with Webpack
* Environment Variable Configuration - [Figaro](https://github.com/laserlemon/figaro)
* Basic Marketing Website via StaticController
* Email - [Mailgun](https://github.com/mailgun/mailgun-ruby)
* Admin Portal - [RailsAdmin](https://github.com/sferik/rails_admin)
* Ability to rename entire app - [Rename](https://github.com/morshedalam/rename)
* Background Jobs - [Sidekiq](https://github.com/mperham/sidekiq/wiki)
* RSpec - For Testing

## Installation Instructions
1. Clone or Fork the repo
2. `gem install bundle && bundle install`
3. `rake g rename:into new_name` will rename your app from railroad to new_name
4. `rake db:create && rake db:migrate` to set up and create database including User table
5. `bundle exec figaro install` to use Figaro ([Example](https://github.com/laserlemon/figaro#example))
6. Configure Shopify app credentials using config/application.yml
7. To access the `RailsAdmin` section of site, set the `superuser` attribute on your user account to `true`

## Working locally
```sh
# Start development server
rails s

# For background jobs
redis-server
bundle exec sidekiq

# Start rails console
rails c
```