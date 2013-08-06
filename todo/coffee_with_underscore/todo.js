// Generated by CoffeeScript 1.6.3
var TodoCtrl;

TodoCtrl = function($scope) {
  $scope.todos = [
    {
      text: "learn angular",
      done: true
    }, {
      text: "build an angular app",
      done: false
    }
  ];
  $scope.addTodo = function() {
    $scope.todos.push({
      text: $scope.todoText,
      done: false
    });
    return $scope.todoText = '';
  };
  $scope.remaining = function() {
    return _.chain($scope.todos).filter(function(todo) {
      return todo.done;
    }).size().value();
  };
  return $scope.archive = function() {
    return $scope.todos = _.reject($scope.todos, function(todo) {
      return todo.done;
    });
  };
};
