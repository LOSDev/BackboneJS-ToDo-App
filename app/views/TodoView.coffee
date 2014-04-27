class TodoApp.Views.TodoView extends Backbone.View
  el: '#todoWrap'

  events:
    'keypress #createItemInput': 'createItem'
    'click #createTask': 'createItem'

  initialize: (args) ->
    @todos = args.todos
    @todoListView = args.todoListView
    @todoStatsView = args.todoStatsView

    @createItemInput = $('#createItemInput')

    @todos.bind('add', @todoListView.addItem, @todoListView)
    @todos.bind('change', @todoStatsView.render, @todoStatsView)
    @todos.bind('destroy', @todoStatsView.render, @todoStatsView)

  render: ->
    @todoListView.render()
    @todoStatsView.render()

  createItem: (event) ->
    console.log event
    if (event.keyCode is 13 or event.type is 'click') && @createItemInput.val()
      @todos.create({title: @createItemInput.val()})

      @todoStatsView.render()
