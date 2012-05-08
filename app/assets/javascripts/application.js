// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require lib/underscore
//= require lib/backbone
//= require_tree ./templates

var Item = Backbone.Model.extend();

var ItemView = Backbone.View.extend({
  template: _.template('<a href="#lists" class="button new-list">Create New List</a>'),

  render: function(){
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});

var ItemList = Backbone.Collection.extend({
  initialize: function(id) {
    this.id = id;
  },

  model: Item,

  url: function(){
    return '/lists/' + this.id + '/items'
  }
});

var NewListView = Backbone.View.extend({
  template: _.template('<a href="#lists" class="button new-list">Create New List</a>'),

  initialize: function(){
    this.render();
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  }
});

var List = new (Backbone.Router.extend({
  routes: { 
    "": "index",
    "lists/:id": "show"
  },

  initialize: function(){
    this.newListView = new NewListView();
  },

  start: function(){
    Backbone.history.start();
  },

  index: function(){
    $('#app').append(this.newListView.el);
  },

  show: function(){
    this.itemList = new ItemList(2);
    alert('lists views');
  }
}));

$(function(){ List.start(); })