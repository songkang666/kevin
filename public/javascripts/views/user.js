var USER_VIEW = Backbone.View.extend({
    tagName: 'tr',
    template: _.template($('#user-template').html()),

    initialize: function() {
    },

    render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    }
});

var user_view = new USER_VIEW;
