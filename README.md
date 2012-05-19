# List City

List City is a Rails-based list application that is meant to be managed on a mobile device. This application 
came from not being able to find a simple solution to creating and managing a grocery list from week to week and 
also be able to share it between multiple people so it can be kept up to date.

Additionally, this application provided a test bed for Backbone. The `rails` branch is purely rails and server-side rendering. The `backbone` branch implements Backbone.js and uses the Rails application purely as an API end-point.

Just create a new list and then share the URL with whomever else you'd like to be able to modify the list.

## Running the app

    $ bundle install
    $ rails s