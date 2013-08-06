TodoCtrl = ($scope) ->
  $scope.todos = [
    { text: "learn angular", done: false},
    { text: "build an angular app", done: false}
  ]

  $scope.addTodo = ->
    $scope.todos.push( {text: $scope.todoText, done: false} )
    $scope.todoText = ''

  $scope.remaining = ->
    count = 0
    angular.forEach $scope.todos, (todo)->
      count += 1 if todo.done
    count

  $scope.archive = ->
    oldTodos = $scope.todos
    $scope.todos = []
    angular.forEach oldTodos, (todo)->
      $scope.todos.push(todo) if !todo.done
