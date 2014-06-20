var CASE_VIEW = Backbone.View.extend({
    tagName: 'tr',
    template: _.template($('#case-template').html()),

    initialize: function() {
    },

    render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    }
});

var CASE_VIEWS = Backbone.View.extend({
    el: 'tbody',

    initialize: function() {
        this.collection = new CASES;
        this.listenTo(this.collection, 'all', this.render);
        var that = this;
        this.collection.fetch();
        setInterval(function() {that.collection.fetch();}, 60000);
        return this;
    },

    startAt: 0,
    step: 5,
    endAt: 0,
    rotate: null,

    render: function() {
        var that = this,
            len = this.collection.length;
        if(len <= 0) {
            $('table').hide('slow');
        } else {
            $('table').show('slow');
        };

        if(this.rotate) {
            clearInterval(this.rotate);
        };
        function show() {
            if(that.startAt >= len) {
                that.startAt = 0;
            }
            var p = that.startAt + that.step;
            that.endAt = p > len ? len: p;
            that.$el.empty();
            for(var i=that.startAt; i<that.endAt; i++) {
                that.addOne(that.collection.at(i));
            }
            that.startAt = that.endAt;
            that.endAt = that.startAt + that.step;
        };
        show();
        that.rotate = setInterval(show, 10000);
        return this;
    },

    addOne: function(lawcase) {
        var view = new CASE_VIEW({model: lawcase});
        this.$el.append(view.render().el);
        return this;
    }
});
var appView = new CASE_VIEWS;