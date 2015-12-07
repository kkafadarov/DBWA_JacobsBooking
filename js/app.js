(function() {
var app = angular.module("jBook", []);

var dummies = [
    {name: 'Vacuum 1', status: 'Booked'},
    {name: 'Vacuum 2', status: 'Booked'},
    {name: 'Vacuum 3', status: 'Booked'},
    {name: 'Room 4', status: 'Available'},
];

var dummiesMyBookings = [
    {name: 'Room Bla', status: 'Pending approval', date: '11/02/2016', time: '8:30'},
    {name: 'Room Bla', status: 'Pending approval', date: '11/02/2016', time: '8:30'}
];

var dummiesRequests = [
    {name: "Room Bla", requestBy: "Kiril Kafadarov",  date: '11/02/2016', time: '8:30'},
    {name: "Room Bla", requestBy: "Kiril Kafadarov",  date: '11/02/2016', time: '8:30'},
    {name: "Room Bla", requestBy: "Kiril Kafadarov",  date: '11/02/2016', time: '8:30'},
    {name: "Room Bla", requestBy: "Kiril Kafadarov",  date: '11/02/2016', time: '8:30'},
    {name: "Room Bla", requestBy: "Kiril Kafadarov",  date: '11/02/2016', time: '8:30'},
    {name: "Room Bla", requestBy: "Kiril Kafadarov",  date: '11/02/2016', time: '8:30'}
];

app.controller('JBookController', function(){

    this.myBookings = dummiesMyBookings;
    this.bookables = dummies;
    this.pendingRequests = dummiesRequests;
});


})();
