(function() {
var app = angular.module("jBook", []);

var dummies = [
    {name: 'Vacuum 1', status: 'Booked'},
    {name: 'Vacuum 2', status: 'Booked'},
    {name: 'Vacuum 3', status: 'Booked'},
    {name: 'Room 4', status: 'Available'},
];

app.controller('JBookController', function(){

    this.bookables = dummies;
});

})();
