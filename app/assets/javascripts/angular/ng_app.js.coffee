'use strict';

define [
  'angular/angular'
  ], (angular) ->

  class NgApp

    constructor: (@_ng) ->

    addControllers: (controllers) ->
      for name, fn of controllers
        @_ng.controller name, fn

    draw: (routes) ->
      @_ng.config ['$routeProvider', ($routeProvider) ->
        for route, options of routes
          $routeProvider.when route, options
      ]