/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      searchTerm: "",
      trip: "",
      

           
    };
    
  },
  created: function() {
    // axios.get('/trips').then(function(response) {
    //   console.log(response.data);
    //   this.trips = response.data;
    // }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        search: this.searchTerm
      };
      axios
        .get("/trips?id=barcelona")
        .then(function(response) {
          console.log(response.data);
          this.trip = response.data;
        }.bind(this));
    }
  }
};

// End template


// -----Begin router------------
var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router

});

