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

var dummiesOverdueObj = [
	{name: "Room bla", bookedBy: "V", dueDate: '12/05/2016'},
	{name: "Room bla", bookedBy: "V", dueDate: '12/05/2016'},
	{name: "Room bla", bookedBy: "V", dueDate: '12/05/2016'},
];

var dummiesAdmins = [
    {name: "John Doe", status: "admin"},
    {name: "John Doe", status: "admin"},
    {name: "John Doe", status: "admin"},
    {name: "John Doe", status: "admin"}
];

app.controller('JBookController', function(){

    this.myBookings = dummiesMyBookings;
    this.bookables = dummies;
    this.pendingRequests = dummiesRequests;
    this.overdueObjects = dummiesOverdueObj;
    this.admins = dummiesAdmins;
});

app.controller('SidebarController', function(){

    this.tab = 1;

    this.selectTab = function(newTab) {
        this.tab = newTab;
    };

    this.checkTab = function(cmpTab) {
            if(cmpTab == this.tab)return true;
            return false;
    };

    this.tabToText = function(tab) {
        if(tab == 1) return "Book";
        if(tab == 2) return "My Bookings";
        if(tab == 3) return "Manage Objects";
        if(tab == 4) return "Pending Requests";
        if(tab == 5) return "Overdue Objects";
        if(tab == 6) return "Manage Admins";
        if(tab == 7) return "Logout";
        return "";
    };

});


})();
