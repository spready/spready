'use strict';

define [
  'jquery'
  ], ($) ->

  TodayController = ($scope, $routeParams) ->
    $scope.name = 'Today'
  TodayController.$inject = ['$scope', '$routeParams']

  OlderController = ($scope, $routeParams) ->
    $scope.name = 'Older'
  OlderController.$inject = ['$scope', '$routeParams']

  {
    TodayController: TodayController
    OlderController: OlderController
  }