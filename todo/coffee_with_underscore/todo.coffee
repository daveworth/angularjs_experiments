TodoCtrl = ($scope) ->
  $scope.todos = [
    { text: "learn angular", done: true},
    { text: "build an angular app", done: false}
  ]

  $scope.addTodo = ->
    $scope.todos.push( {text: $scope.todoText, done: false} )
    $scope.todoText = ''

  $scope.remaining = ->
    _.chain($scope.todos)
       .filter (todo)->
         todo.done
       .size()
     .value()

  $scope.archive = ->
    $scope.todos = _.reject $scope.todos, (todo)->
      todo.done
