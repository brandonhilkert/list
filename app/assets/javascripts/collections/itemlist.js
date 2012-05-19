var ItemList = Backbone.Collection.extend({
  model: Item,

  initialize: function(id) {
    this.id = id;
  },

  url: function(){
    return '/lists/' + this.id + '/items';
  },

  destroyAll: function(){
   while (this.models.length > 0) {
      this.models[0].destroy();
    } 
  }

});