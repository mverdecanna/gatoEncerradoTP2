
'use strict';
var ServicesModule = angular.module('LaberintosServiceModule', []);


ServicesModule.factory('LaberintosService', ['$resource',  function($resource) {
    return $resource('//localhost:7000/laberintos/:id', {'id': '@id'}, {
    	'query': { method: 'GET', isArray: true},
        'update': { method: 'PUT' },
        'save': { method: 'POST' },
        'remove': { method:'DELETE' }
    });
}]);
	


/*app.factory('Libros', function($resource) {
    return $resource('/libros/:id', {'id': '@id'}, {
    	'query': { method: 'GET', isArray: true},
        'update': { method: 'PUT' },
        'save': { method: 'POST' },
        'remove': { method:'DELETE' }
    });
});

app.factory('LibrosNoLeidos', function($resource) {
    return $resource('/librosNoLeidos/:usuario', 
    		{'usuario': '@usuario'}, {
    	'porAutor': { method: 'GET', isArray: true, 
    		params:{'autor': '@autor'}}
    });
});*/
