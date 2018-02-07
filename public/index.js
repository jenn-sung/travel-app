/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      searchTerm: "",
      trip: "",
      google: "",
      isVisible: false

           
    };
    
  },
  created: function() {
  },
  methods: {
    submit: function() {
      this.isVisible = true;
      var params = {
        search: this.searchTerm
      };
      axios.get("/trips?id=barcelona")
        .then(function(response) {
          this.trip = response.data;
        }.bind(this));

    },

//     var map;

//     function initMap() {
//       var uluru = {lat: -25.363, lng: 131.044};
//       var map = new google.maps.Map(document.getElementById('map'), {
//         zoom: 4,
//         center: uluru
//       });
//       var marker = new google.maps.Marker({
//         position: uluru,
//         map: map
//       });
//     }
    }
};





// -----Begin router------------
var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage }
    
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,

});

