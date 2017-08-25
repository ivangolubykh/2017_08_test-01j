'use strict';


var TaskListApp = angular.module('TaskListApp', ['ngCookies']);

TaskListApp.controller('TaskListCtrl', function TaskListController($scope, $http, $cookies) {
  $scope.gel_list_data = function() {
    $http.get('/get_data_json/').then(function(response) {
      $scope.data_dict = response.data.dict;
    });
  }
  $scope.gel_list_data()

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
        $http(req).then(function(response_success){
            console.log('2xx - Все хорошо, данные добавлены:\n', response_success.data.dict);
            $scope.gel_list_data();
        }, function(response_error){
            console.log('4xx - error response:\n', response_error);
        });
      });
    }
  };
});


//           $scope.data_dict[1] = {name: 'n1', text: 't1156'}
