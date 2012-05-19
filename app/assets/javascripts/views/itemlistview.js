var ItemListView = Backbone.View.extend({
  tagName: 'ul',
  className: 'items',

  initialize: function(){
    this.collection.on('add', this.addOne, this);
    this.collection.on('reset', this.addAll, this);
  },

  render: function(){ 
    this.addAll();
  },

  addOne: function(item){
    var itemView = new ItemView({model: item});
    this.$el.append(itemView.render().el);
  },

  addAll: function(){
    this.collection.forEach(this.addOne, this);
  },
});