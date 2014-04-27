class TodoApp.Views.TodoListView extends Backbone.View
  el: '#todoList'

  initialize: (args) ->
    @todos = args.todos
  render: ->
    @todos.each((todo) =>
      todoListItemView = new TodoApp.Views.TodoListItemView(todo: todo)
      @$el.append(todoListItemView.render().el)
    )

  addItem: (todo) ->
    todoListItemView = new TodoApp.Views.TodoListItemView(todo: todo)
    @$el.append(todoListItemView.render().el)

