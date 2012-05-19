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
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views


var List = new (Backbone.Router.extend({
  routes: { 
    "": "index",
    "lists/new": "new",
    "lists/:id": "show",
    "lists/:id/clear": "clear"
  },

  start: function(){
    Backbone.history.start();
  },

  index: function(){
    var newListView = new NewListView();
    $('#app').html(newListView.el);
  },

  new: function(){
    var router = this;
    var list = new MainList();
    list.save({}, {
      success: function(){ 
        router.navigate("lists/" + list.id, {trigger: true});
      }
    });
  },

  show: function(id){
      var itemList      = new ItemList(id),
          itemListView  = new ItemListView({collection: itemList}),
          addItemView   = new AddItemView({collection: itemList}),
          clearAllView  = new ClearAllView({collection: itemList});

      $('#app').html(addItemView.el)
        .append(itemListView.el)
        .append(clearAllView.el);
      itemList.fetch();
  }
}));

$(function(){ List.start(); })