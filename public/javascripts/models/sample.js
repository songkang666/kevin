var CASE = Backbone.Model.extend({
    defaults: {
        id: '',
        case_num: '-',
        case_reason: '-',
        party: '-',
        start_time: '-'
    }
});

var CASES = Backbone.Collection.extend({
    url: '/cases',//?' + Math.random(),
    model: CASE
})