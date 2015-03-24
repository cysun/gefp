var app = angular.module("gefpApp", []);

app.factory('appFactory', function() {

  var cars = [
  { make: 'Toyota', model: 'Prius', type: 'Hybrid', year: '2014', price: 24000  },
  { make: 'Chevorlet', model: 'Volt', type: 'Electric', year: '2013', price: 35300 },
  { make: 'Lexus', model: 'ct 200h', type: 'Hybrid', year: '2015', price: 40000 },
  ];

  var sold = [ { make: 'Subaru', model: 'WRX', type: 'Gas', year: '2014', price: 42000 }];

  var factory = {};

  return factory;
});

app.controller("checkpointController", function($scope, appFactory) {



});