/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "SUP",
      searchTerm: "",
      trips: []  
    };
  },
  created: function() {
    axios.get('/trips').then(function(response) {
      // console.log(response.data);
      this.trips = response.data;
    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        search: this.searchTerm
      };
      axios
        .get("/trips?id=barcelona")
        .then(function(response) {
          router.push("/");

        });
    }
  }
};

var ResultsPage = {
  template: "#results-page",
  data: function() {
    return {
      message2: "SUP",
      trips: []  
    };
  },
  created: function() {
  },
  methods: {}
    
};

// End template


// -----Begin router------------
var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/results", component: ResultsPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router

});

