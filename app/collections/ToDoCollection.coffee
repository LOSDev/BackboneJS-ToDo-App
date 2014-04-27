class TodoApp.Collections.TodoCollection extends Backbone.Collection
  
  model: TodoApp.Models.Todo
  localStorage: new Store('TodoApp')
  
  done: ->
    @filter((todo) ->
      todo.get('done')
    )
  remaining: ->
    @without.apply(@, @done())