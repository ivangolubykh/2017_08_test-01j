'use strict';


var TaskListApp = angular.module('TaskListApp', ['ngCookies']);
TaskListApp.controller('TaskListCtrl', function TaskListController($scope, $http) {
  $http.get('/get_data_json/').then(function(response) {
    $scope.data_list = response.data.list;
  });
});


TaskListApp.controller('TaskAddCtrl', function TaskAddController($scope, $http, $cookies) {
  $scope.add = function(add_task, AddTaskForm) {
    if(AddTaskForm.$valid){
      $http.get("/get_csrf/", add_task).then(function success (response) {
//        $scope.csrf_token_value=response.data;
        var req = {
          method: 'POST',
          url: '/add_data_json/',
          headers: {
            'X-CSRFToken': $cookies.get('csrftoken'),
          },
          data: $scope.add_task,
        }
        $http(req).then(function(response_success){console.log('2xx - Все хорошо:\n', response_success);}, function(response_error){console.log('4xx - error response:\n', response_error);});
      });
    }
  };
});
