angular.module('akiMain', [])
.controller('MainCtrl', function($scope, $http){
  $scope.matches = [];
  $scope.today_matches = [];
    // get players


  $scope.todayMatch = function(match, date) {
    match.date = date;
    $scope.today_matches.push(match);

    var idx = $scope.matches.indexOf(match);
    if (idx > -1) {
      $scope.matches.splice(idx, 1);
    }

    $http.post('/matches/update', {id: match.id, date:date}).success(function(data) {
      // placeholder for manipulation
      console.log("something: " + data);
    });
  }  

  $scope.noneMatch = function(match, date) {
    match.date = date;
    $scope.matches.push(match);

    var idx = $scope.today_matches.indexOf(match);
    if (idx > -1) {
      $scope.today_matches.splice(idx, 1);
    }

    $http.post('/matches/update', {id: match.id, date:date}).success(function(data) {
      // placeholder for manipulation
    });
  }    

  $http.get('/matches/index.json').
    success(function(data) {
      $scope.matches = data.matches;
      $scope.today_matches = data.today_matches;
     // console.log(data.players);
    });  

})

