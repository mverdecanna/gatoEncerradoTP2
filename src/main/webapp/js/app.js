'use strict';
var gatoEncerradoApp = angular.module('gatoEncerradoApp', [
  'ngRoute',
  'ngResource',
  'LaberintosServiceModule'
]);

var laberintoSeleccionado= null;
var inventarioActual= null;
var habitacionActual= null;
//configure our routes

gatoEncerradoApp.config(function($routeProvider) {
$routeProvider
    .when('/', {
        templateUrl : 'habitacion.html',
        controller  : 'laberintosController'
    })
    
    .when('/', {
        templateUrl : 'home.html',
        controller  : 'laberintosController'
    })

    .when('/habitacion', {
        templateUrl : 'habitacion.html',
        controller  : 'habitacionController'
    })
    
    .when('/laberinto', {
        templateUrl : 'laberinto.html',
        controller  : 'vistaLaberintoController'
    })
	
	.when('/laberinto/:id' ,{
		templateUrl : 'laberinto.html',
        controller  : 'vistaLaberintoController'
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


gatoEncerradoApp.controller('laberintosController', ['$scope', '$routeParams', '$location', 'LaberintosService','$http','$timeout', 
  function($scope, $routeParams, $location, LaberintosService,$http,$timeout){
	$scope.imagenPrincipal = 'imagenes/gato_encerrado.jpg';
	$scope.imagenSeleccionable = 'imagenes/casa-terror.jpg';
	$scope.laberintos = LaberintosService.query();
	$scope.lab=null ;
	
	
	/*$scope.verDetalle = function(laberinto){
		//$scope.imagenPrincipal = $scope.imagenSeleccionable;
		$location.path('/laberinto');
		$location.url('/laberinto/'+ laberinto.id );
		laberintoSeleccionado = laberinto;
		$scope.lab=laberinto;
	};*/
	
	$scope.verDetalle = function(laberinto){
		if(laberintoSeleccionado != null){
			if(confirm("Estas seguro de cambiar de Laberinto?")){
				$location.path('/laberinto');
				$location.url('/laberinto/'+ laberinto.id );
				laberintoSeleccionado = laberinto;
				$scope.lab=laberinto;
			}
		}else{
			$location.path('/laberinto');
			$location.url('/laberinto/'+ laberinto.id );
			laberintoSeleccionado = laberinto;
			$scope.lab=laberinto;
		}	
	};
	
	/*
	$scope.irAHabitacion=function(){
			$location.path('/habitacion');
		};*/
	
	/*
	$scope.mostrarLaberinto = function() {
			console.log(laberintoSeleccionado.id);
			$http.get("/laberinto/1/" + laberintoSeleccionado.id).success(function(data){
			$scope.habitaciones = data.habitacionesMin;
			$scope.habitacionActual = data.habitacionMostrar;
			$scope.inventarioActual = data.inventarioMin;
			console.log(laberintoSeleccionado.id);
			}).error(errorHandler);
				
		};*/
	
	
function errorHandler(error) {
        $scope.notificarError(error.data);
    };
		
	$scope.msgs = [];
    $scope.notificarMensaje = function(mensaje) {
        $scope.msgs.push(mensaje);
        $scope.notificar($scope.msgs);
    };

    $scope.errors = [];
    $scope.notificarError = function(mensaje) {
        $scope.errors.push(mensaje);
        $scope.notificar($scope.errors);
    };

    $scope.notificar = function(mensajes) {
        $timeout(function() {
            while (mensajes.length > 0) mensajes.pop();
        }, 3000);
    };

}]);
gatoEncerradoApp.controller('vistaLaberintoController', ['$scope', '$routeParams', '$location', 'LaberintoService','$http','$timeout', 
          function($scope, $routeParams, $location, LaberintoService,$http,$timeout){
			
			$scope.labActual = laberintoSeleccionado;
			console.log($scope.labActual);
	
		$scope.irAHabitacion=function(){
		$location.path('/habitacion');
		$http.get("/laberinto/1/" + laberintoSeleccionado.id).success(function(data){
		//$scope.habitaciones = data.habitacionesMin;
		habitacionActual = data.habitacionMostrar;
		inventarioActual = data.inventarioMin;
		console.log(laberintoSeleccionado.id);
		}).error(errorHandler);
			
	};
	
	
	/*
	$scope.verDetalle = function(laberinto){
			//$scope.imagenPrincipal = $scope.imagenSeleccionable;
			$location.path('/laberinto');
			$location.url('/laberinto/' + laberinto.id + "/" + "1754736431");
			$scope.laberintoSeleccionado = laberinto;
			
		};*/
	
	
	
	/*
	$scope.mostrarLaberinto = function() {
			$location.path('/habitacion');
			$http.get("/laberinto/1756975314/2082372017").success(function(data){
				
				$scope.habitaciones = data.habitacionesMin;
				$scope.habitacionActual = data.habitacionMostrar;
				$scope.inventarioActual = data.inventarioMin;
				console.log($scope.habitacionActual);
				console.log($scope.inventarioActual);
				console.log($scope.habitaciones);
			}).error(errorHandler);
				
		};*/
	
	
function errorHandler(error) {
        $scope.notificarError(error.data);
    };
		
	$scope.msgs = [];
    $scope.notificarMensaje = function(mensaje) {
        $scope.msgs.push(mensaje);
        $scope.notificar($scope.msgs);
    };

    $scope.errors = [];
    $scope.notificarError = function(mensaje) {
        $scope.errors.push(mensaje);
        $scope.notificar($scope.errors);
    };

    $scope.notificar = function(mensajes) {
        $timeout(function() {
            while (mensajes.length > 0) mensajes.pop();
        }, 3000);
    };

}]);

gatoEncerradoApp.controller('habitacionController', ['$scope', '$routeParams', '$location', 'LaberintoService','$http','$timeout', 
          function($scope, $routeParams, $location, LaberintoService,$http,$timeout){
		$scope.nombrelab=laberintoSeleccionado.nombreLaberinto;
		$scope.habitacionActual = habitacionActual;
		$scope.inventarioActual = inventarioActual;
		
	function errorHandler(error) {
        $scope.notificarError(error.data);
    };
		
	$scope.msgs = [];
    $scope.notificarMensaje = function(mensaje) {
        $scope.msgs.push(mensaje);
        $scope.notificar($scope.msgs);
    };

    $scope.errors = [];
    $scope.notificarError = function(mensaje) {
        $scope.errors.push(mensaje);
        $scope.notificar($scope.errors);
    };

    $scope.notificar = function(mensajes) {
        $timeout(function() {
            while (mensajes.length > 0) mensajes.pop();
        }, 3000);
    };
	
}]);
	
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