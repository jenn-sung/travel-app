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
  },
  methods: {
    submit: function() {
      var params = {
        search: this.searchTerm
      };
      axios.get("/trips?id=barcelona")
        .then(function(response) {
          console.log(response.data);
          this.trip = response.data;
        }.bind(this));
    }
  }
};


var ResultsPage = {
  template: "#results-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      trip: ""
    };
  },
  created: function() {
    axios.get("/results").then(function(response) {
      this.trip = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};



// End template


// -----Begin router------------
var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/results", component: ResultsPage}
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router

});

