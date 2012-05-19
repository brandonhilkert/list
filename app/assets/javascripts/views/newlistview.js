var NewListView = Backbone.View.extend({
  template: _.template('<a href="#lists/new" class="button new-list">Create New List</a>'),

  initialize: function(){
    this.render();
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  }
});