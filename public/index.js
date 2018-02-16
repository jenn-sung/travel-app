/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      searchTerm: "",
      trip: "",
      google: "",
      isVisible: false,
      visible: true      
    };
  },

  created: function() {
  },
  methods: {
    submit: function() {
      this.isVisible = true;
      this.visible = !this.visible;
      var params = {
        search: this.searchTerm
      };
    axios.get("/trips?id=barcelona")
      .then(function(response) {
        this.trip = response.data;
    }.bind(this));
  },
  computed: {},
    
// Map-------------------

  // mounted: function() {

  //   // axios.get('/places').then(function(response) {
  //   //   this.places = response.data;
  //   //   var tripPlaces = this.places;

  //     var initMap = function(user, places) {

  //     var userLocation = {lat: user.latitude, lng: user.longitude};
  //     var map = new google.maps.Map(document.getElementById('userMap'), {
  //       zoom: 13, 
  //       center: userLocation,
  //       scrollwheel: false,
  //     });
  //     var userMarker = new google.maps.Marker({
  //       position: userLocation,
  //       map: map,
  //     });
  //     var usermarkerInfo = new google.maps.InfoWindow({
  //       content: '<div class="userMap"><h6>' + "Your location" + '</h6></div>',
  //       disableAutoPan: true
  //     });
  //     userMarker.addListener('mouseover', function() {
  //       userMarkerInfo.open(map, userMarker);
  //     });
  //     userMarker.addListener('mouseover', function() {
  //       userMarkerInfo.close(map, userMarker);
  //     });
    
    // var icon = {
    //   url: "/img/recycling.png",
    //   scaledSize: new google.maps.Size(30, 30),
    // };

    // for (var i = 0; i < places.length; i++) {
    //         var location = places[i].geometry.location;
    //         var placeName = places[i].name;
    //         var marker = new google.maps.Marker({
    //           position: location,
    //           map: map,
    //           icon: icon
    //         });
    //         marker.info = new google.maps.InfoWindow({
    //           content: '<div class="userMap"><h6>' + placeName + '</h6> </div>',
    //           disableAutoPan: true
    //         });
    //         google.maps.event.addListener(marker, 'mouseover', function() {
    //           this.info.open(map,this);
    //         });
    //         google.maps.event.addListener(marker, 'mouseout', function() {
    //           this.info.close(map,this );
    //         });
    //       }
    //     };
      
    //     $(document).ready(function() {
    //       initMap(loggedUser, recylingPlaces);
  
    //     });
    //   }.bind(this));
  //   }
  // },
    },
};
// -----Begin router------------

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage }],

  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});


