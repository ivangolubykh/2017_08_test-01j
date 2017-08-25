'use strict';
var TaskLstApp = angular.module('TaskLstApp', []);

TaskLstApp.controller('TaskListCtrl', function TaskLstController($scope, $http) {
  $http.get('/get_data_json/').then(function(response) {
        $scope.data_list = response.data.list;
      });


//  $scope.phones = [
//    {
//      name: 'Nexus S',
//      snippet: 'Fast just got faster with Nexus S.'
//    }, {
//      name: 'Motorola XOOM™ with Wi-Fi',
//      snippet: 'The Next, Next Generation tablet.'
//    }, {
//      name: 'MOTOROLA XOOM™',
//      snippet: 'The Next, Next Generation tablet.'
//    }
//  ];
//  $scope.hello = "Hello, World!"
});


