'use strict';

define [
  'angular/ng_app'
  'spready/controllers/forumsController'
  ], (NgApp, controllers) ->

  forums = angular.module 'forums', []
  
  app = new NgApp(forums)
  app.addControllers(controllers)

  app.draw(
    '/today': {
      controller: 'TodayController'
      templateUrl: 'index.html'
    }
    '/older': {
      controller: 'OlderController'
      templateUrl: 'index.html'
    }
    '/new': {
      controller: 'NewController'
      templateUrl: 'index.html'
    }
  )

  angular.bootstrap document, ['forums']
