/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
    };
  },
  created: function() {
    axios.get('/trips').then(function(response) {
      this.countries = response.data;
    }.bind(this));
  },
  methods: {

  },
  computed: {}
};

// End template-----Begin router------------
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
  router: router
});
