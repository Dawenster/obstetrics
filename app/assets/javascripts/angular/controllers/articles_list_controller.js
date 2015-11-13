var app = angular.module('obstetrics');

app.controller('ArticlesListCtrl', ['$scope', function($scope) {
  $('.article-list').sortable();
}]);