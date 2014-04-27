class TodoApp.Views.TodoStatsView extends Backbone.View
  el: '#todoStats'

  initialize: (args) ->
    @todos = args.todos

  render: ->
    tasks = @todos.length
    doneTasks = @todos.done().length
    percentage = Math.round(doneTasks / tasks * 100)
    @$el.html(
      'Alle: ' + @todos.length + '  -  ' +
      'Erledigt: ' + @todos.done().length + '  -  ' +
      'Verbleibend: ' + @todos.remaining().length +
      '<br><br><div class="progress">' +
      '<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ' +
      percentage +
      '%;">' +
      percentage +
      '%</div></div>'
    )
