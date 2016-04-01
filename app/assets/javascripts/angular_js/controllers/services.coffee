window.Lipans.App.controller 'ServicesCtrl', ($scope,$element,ServicesApi,templateHelper, Modal) ->
  'use strict'

  $scope.page = 1

  $scope.init = ()->
    $scope.load()

  $scope.load = ()->
    ServicesApi.api1({page: $scope.page}).then (rs)->
      if rs.status == 1
        $scope.services = rs.data.services
        $scope.total = rs.data.total
        $scope.totalPages = [1..$scope.total]
        $scope.is_full = rs.data.is_full
      else
        alert rs.message

  $scope.setPage = (page)->
    $scope.page = page
    $scope.load()

  $scope.addNewService = ()->
    Modal.action('add_new_service','modal-add-new-service', ($scope,modalInstance)->
      ServicesApi.api2().then (rs)->
          if rs.status == 1
            $scope.types = rs.data
          else
            alert rs.message

        $scope.create = (service)->
          ServicesApi.api3(service).then (rs)->
            if rs.status == 1
              modalInstance.dismiss('cancel')
            else
              $scope.error = rs.status
    , ()->
      if $scope.is_full == 1
        $scope.page += 1
      $scope.load()
    )
    return 

  $scope.deleteService = ()->
    servicesId = []
    angular.forEach($element.find('.service_id:checked'), (e)->
      servicesId.push(e.value)
    )
    ServicesApi.api4({services_id: servicesId}).then (rs)->
      if rs.status == 1
        $scope.load()
      else
        alert rs.message
    return