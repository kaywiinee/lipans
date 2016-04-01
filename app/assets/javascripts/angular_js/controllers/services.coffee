window.Lipans.App.controller 'ServicesCtrl', ($scope,$element,ServicesApi,templateHelper,$modal) ->
  'use strict'

  $scope.page = 1

  $scope.init = ()->
    ServicesApi.api1().then (rs)->
      if rs.status == 1
        $scope.services = rs.data.services
        $scope.totalPages = [1..rs.data.total]
      else
        alert rs.message

  $scope.setPage = (page)->
    $scope.page = page
    ServicesApi.api1({page: page}).then (rs)->
      if rs.status == 1
        $scope.services = rs.data.services
        $scope.totalPages = rs.data.total
      else
        alert rs.message

  $scope.addNewService = ()->
    modalInstance = $modal.open(
      templateUrl: templateHelper.get 'add_new_service'
      windowClass: 'modal-add-new-service'
      keyboard: false
      backdropClick: false
      backdrop: 'static'
      controller: ($scope)->
        console.log 'a'
    )