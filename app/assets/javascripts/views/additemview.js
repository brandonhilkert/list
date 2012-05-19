var AddItemView = Backbone.View.extend({
  id: 'new-item',
  template: _.template('<input type="text" name="item" /><button>Add</button>'),

  initialize: function(){
    this.render();
  },

  events: {
    "click button"    : "createOnAdd",
    "keypress input"  : "createOnEnter"
  },

  createOnAdd: function(){
    this.createItem();
  },

  createOnEnter: function(e){
    if (e.keyCode == 13) this.createItem();
  },

  createItem: function(){
    var input = $("#new-item input");

    if (input.val()) {
      this.collection.create({
        list_id: this.collection.id,
        description: input.val()
      });

      input.val('');
    }
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  }
});