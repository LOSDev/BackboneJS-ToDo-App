class TodoApp.Models.Todo extends Backbone.Model
  defaults:
    'done': false
    'title': null

  toggleStatus: ->
    @save(done: !@get('done'))
