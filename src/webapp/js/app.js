'use strict';
var gatoEncerradoApp = angular.module('gatoEncerradoApp', ['ngRoute']);


//configure our routes
gatoEncerradoApp.config(function($routeProvider) {
$routeProvider
    /*.when('/', {
        templateUrl : 'habitacion.html',
        //controller  : 'mainController'
    })*/
    
    .when('/', {
        templateUrl : 'home.html',
        //controller  : 'mainController'
    })

    .when('/habitacion', {
        templateUrl : 'habitacion.html',
        //controller  : 'habitacionesController'
    })
    
    .when('/laberinto', {
        templateUrl : 'laberinto.html',
        //controller  : 'laberintoController'
    });
});

/*gatoEncerradoApp.controller('controlerLaberintos',function($scope, LaberintosService){
	$scope.laberintos = function() {
		LaberintosService.query()
	}*/
	
	
	/*$scope.cambiarImagen = function(){
		$scope.imagenPrincipal = $scope.imagenSeleccionable;
	};
})*/


gatoEncerradoApp.controller('LaberintosController',function($scope){
	$scope.imagenPrincipal = 'imagenes/gato_encerrado.jpg';
	$scope.imagenSeleccionable = 'imagenes/casa-terror.jpg';
	
	$scope.cambiarImagen = function(){
		$scope.imagenPrincipal = $scope.imagenSeleccionable;
	};
	
	$scope.laberintos = function() {
		LaberintosService.query()
	}
});

/*gatoEncerradoApp.controller('HabitacionesController',function($scope, HabitacionService){
	$scope.habitaciones = HabitacionService.getHabitaciones();
});

gatoEncerradoApp.controller('aboutController', function($scope) {
    $scope.message = 'Look! I am an about page.';
});

gatoEncerradoApp.controller('mainController', function($scope) {
    // create a message to display in our view
    $scope.message = 'Everyone come and see how good I look!';
});*/




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