'use strict';


var TaskListApp = angular.module('TaskListApp', ['ngCookies']);

TaskListApp.controller('TaskListCtrl', function TaskListController($scope, $http, $cookies) {
  $scope.gel_list_data = function() {
    $http.get('/get_data_json/').then(function(response) {
      $scope.data_dict = response.data.dict;
    });
  }
  $scope.gel_list_data()

  $scope.add = function(AddTaskForm) {
    if(AddTaskForm.$valid){
      $http.get("/get_csrf/").then(function success (response) {
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

  $scope.edit = function(id_editing) {
    var new_name = prompt('Исправьте название задачи:', $scope.data_dict[id_editing]['name']);
    if ((new_name != null) && (new_name != undefined) && (new_name.length > 0)) {
      var new_text = prompt('Исправьте текст задачи:', $scope.data_dict[id_editing]['text']);
      if ((new_text == null) || (new_text == undefined) || (new_name.length == 0)) {
        new_text = '';
      }

      $http.get("/get_csrf/").then(function success (response) {
//        $scope.csrf_token_value=response.data;
        var req = {
          method: 'POST',
          url: '/edit_data_json/',
          headers: {
            'X-CSRFToken': $cookies.get('csrftoken'),
          },
          data: {'id': id_editing, 'name': new_name, 'text': new_text},
        }
        $http(req).then(function(response_success){
            console.log('2xx - Все хорошо, данные отредактированы:\n', response_success.data.dict);
            $scope.data_dict[id_editing] = {'name': new_name, 'text': new_text}
            $scope.data_dict[id_editing] = {'name': response_success.data.dict.name,
                                            'text': response_success.data.dict.text}
        }, function(response_error){
            console.log('4xx - error response:\n', response_error);
        });
      });

    }
    else {
      alert("Так нельзя, это обязательное поле!");
    }
  };

  $scope.del = function(id_editing) {
//    var new_name = prompt('Исправьте название задачи:', $scope.data_dict[id_editing]['name']);
//    if ((new_name != null) && (new_name != undefined) && (new_name.length > 0)) {
//      var new_text = prompt('Исправьте текст задачи:', $scope.data_dict[id_editing]['text']);
//      if ((new_text == null) || (new_text == undefined) || (new_name.length == 0)) {
//        new_text = '';
//      }

      $http.get("/get_csrf/").then(function success (response) {
//        $scope.csrf_token_value=response.data;
        var req = {
          method: 'POST',
          url: '/del_data_json/',
          headers: {
            'X-CSRFToken': $cookies.get('csrftoken'),
          },
          data: {'id': id_editing},
        }
        $http(req).then(function(response_success){
            console.log('2xx - Все хорошо, данные удалены:\n', response_success.data.dict);

            delete $scope.data_dict[id_editing];

        }, function(response_error){
            console.log('4xx - error response:\n', response_error);
        });
      });

//    }
//    else {
//      alert("Так нельзя, это обязательное поле!");
//    }
  };


});
