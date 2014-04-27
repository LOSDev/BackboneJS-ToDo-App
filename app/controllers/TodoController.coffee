class TodoApp.Controllers.TodoController extends Backbone.Router
    # routes, initialize
  initialize: ->
    Backbone.history.start()
  
  routes:
    '': 'index'
  
  index: ->
    todos = new TodoApp.Collections.TodoCollection()
    todos.model = TodoApp.Models.Todo
    todos.fetch()

    todoListView = new TodoApp.Views.TodoListView(todos: todos)
    todoStatsView = new TodoApp.Views.TodoStatsView(todos: todos)
    todoView = new TodoApp.Views.TodoView(
      todos: todos,
      todoListView: todoListView,
      todoStatsView: todoStatsView
        )
    todoView.render()

