class TodoApp.Views.TodoListItemView extends Backbone.View
  tagName: 'li'
  className: "list-group-item list-group-item-info"
  initialize: (args) ->
    @todo = args.todo
    @todo.bind('change', @render, @)
    @todo.bind('destroy', @remove, @)

  render: ->
    checkedHtmlAttribute = ''
    divClass = ''

    if @todo.get('done')
      checkedHtmlAttribute = ' checked="checked"'
      divClass = ' class="done"'

    @$el.html(
      
      #'<a href="" class="delete badge" title="Aufgabe löschen"><bold>X</bold></a>' +
      '<button type="button" class="close delete badge" aria-hidden="true" title="Aufgabe löschen">&times;</button>' +
      '<input class="toggleStatus" type="checkbox"' + checkedHtmlAttribute + ' /> ' +
      '<span class="title" contenteditable="true">' + @todo.get('title') + '</span>'
    )
    @
  remove: ->
    @$el.remove()

  events: {
    'click .toggleStatus': 'toggleStatus'
    'click .delete': 'destroy'
    'blur .title': 'changeTitle'
  }

  toggleStatus: ->
    @todo.toggleStatus()

  destroy: ->
    @todo.destroy()
    false
  changeTitle: ->
    if (@$('.title').html() isnt @todo.get('title')) && @$('.title').html()
      @todo.set(title: @$('.title').html())
      @todo.save()
