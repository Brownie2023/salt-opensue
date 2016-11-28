var app = angular.module("app", []);

app.controller("AppCtrl", function($http) {
  var app = this;
  app.todos = null;
  app.new_todo = {"title": ""};

  $http.get("/api/todo").success(function (data) {
      app.todos = data.objects;
  })

  app.add_todo = function() {
    $http.post("/api/todo", app.new_todo).success(function(data) {
      app.todos.push(data);
      app.new_todo.title = "";
    })
  }

  app.delete_todo = function(todo) {
    $http.delete("/api/todo/" + todo.id).success(function(response) {
      app.todos.splice(app.todos.indexOf(todo), 1);
    })
  }

  app.update_todo = function(todo) {
    var todays_date = new Date();
    var formated_date = todays_date.toISOString().slice(0,10).replace(/-/g,"/");
    todo.complete = true;
    todo.date_completed = formated_date;
    $http.put("/api/todo/" + todo.id, todo);
  }

})
