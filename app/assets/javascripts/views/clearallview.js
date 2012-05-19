var ClearAllView = Backbone.View.extend({
  template: _.template('<button class="button destroy-all">Clear All</button>'),

  events: {
    "click button.destroy-all" : "destroyAll"
  },

  initialize: function(){
    this.render();
    this.collection.on('add reset remove', this.setVisibility, this);
  },

  render: function(){
    this.$el.html(this.template()).find("button").hide();
    return this;
  },

  setVisibility: function(){
    if (this.collection.length > 0){
      $("button.destroy-all").show();
    } else {
      $("button.destroy-all").hide();  
    }
  },

  destroyAll: function(){
    this.collection.destroyAll();
  }
});