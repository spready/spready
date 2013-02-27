'use strict';

define [
  'angular/angular'
  ], (angular, controllers) ->
  
  forums = angular.module 'forums', []

  #forums.controller 'ForumsNewestController', ($scope) ->

  # forums.controller 'ForumsNewestController', ForumsNewestController

  forums.config ($routeProvider) ->
    $routeProvider
      .when '/newest', {
        templateUrl: ''
        controller: 'ForumsController'
      }

  # ForumsNewestController = ($scope, $log) ->
  #   $log.log 1

  return forums

