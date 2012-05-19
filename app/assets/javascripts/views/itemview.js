var ItemView = Backbone.View.extend({
  tagName: 'li',
  template: _.template('<%= description %><button class="button destroy">Delete</button>'),

  events: {
    "click button.destroy" : "clear"
  },

  initialize: function(){
    this.model.bind('destroy', this.remove, this);
  },

  render: function(){
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  },

  clear: function() {
    this.model.destroy();
  }
});