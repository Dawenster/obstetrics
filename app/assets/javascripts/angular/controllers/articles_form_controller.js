var app = angular.module('obstetrics');

app.controller('ArticlesFormCtrl', ['$scope', function($scope) {
  if ($(".article-form-holder").data("has-minor-section") == true) {
    $scope.showMajorSection = false
  } else {
    $scope.showMajorSection = true
  }

  $scope.majorSectionClicked = function() {
    $scope.showMajorSection = true
    document.getElementById('article_minor_section_id').selectedIndex = 0;
  }

  $scope.minorSectionClicked = function() {
    $scope.showMajorSection = false
    document.getElementById('article_major_section_id').selectedIndex = 0;
  }
}]);