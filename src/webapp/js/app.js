'use strict';
angular.module('gatoEncerradoApp', [ ])


/*//configure our routes
gatoEncerradoApp.config(function($routeProvider) {
$routeProvider

    // route for the home page
    .when('/', {
        templateUrl : 'pages/home.html',
        controller  : 'mainController'
    })

    // route for the about page
    .when('/habitacion', {
        templateUrl : 'pages/habitacion.html',
        controller  : 'HabitacionesController'
    })

    // route for the contact page
    .when('/contact', {
        templateUrl : 'pages/contact.html',
        controller  : 'contactController'
    });
});*/


gatoEncerradoApp.controller('LaberintosController',function($scope, LaberintoService){
	$scope.laberintos = LaberintoService.getLaberintos();
});

gatoEncerradoApp.controller('HabitacionesController',function($scope, HabitacionService){
	$scope.habitaciones = HabitacionService.getHabitaciones();
});

gatoEncerradoApp.controller('aboutController', function($scope) {
    $scope.message = 'Look! I am an about page.';
});

gatoEncerradoApp.controller('mainController', function($scope) {
    // create a message to display in our view
    $scope.message = 'Everyone come and see how good I look!';
});




/*gatoEncerradoApp.controller('AppCtrl', function($scope, $mdDialog, $mdMedia) {
  $scope.status = '  ';
  $scope.customFullscreen = $mdMedia('xs') || $mdMedia('sm');
  $scope.showAlert = function(ev) {
    // Appending dialog to document.body to cover sidenav in docs app
    // Modal dialogs should fully cover application
    // to prevent interaction outside of dialog
    $mdDialog.show(
      $mdDialog.alert()
        .parent(angular.element(document.querySelector('#popupContainer')))
        .clickOutsideToClose(true)
        .title('This is an alert title')
        .textContent('You can specify some description text in here.')
        .ariaLabel('Alert Dialog Demo')
        .ok('Got it!')
        .targetEvent(ev)
    );
};

*/