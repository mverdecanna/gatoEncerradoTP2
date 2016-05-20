angular.module('gatoEncerradoApp')
	.controller('JugadorActual',function($scope, JugadorService){
	$scope.jugador = JugadorService.getJugador();
})