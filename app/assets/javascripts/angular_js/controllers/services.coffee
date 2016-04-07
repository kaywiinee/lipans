window.Lipans.App.controller 'ServicesCtrl', ($scope,$element,ServicesApi,templateHelper,Modal,fileReader) ->
  'use strict'

  $scope.page = 1

  $scope.init = ()->
    $scope.load()
    $scope.loadType()

  $scope.load = ()->
    ServicesApi.api1({page: $scope.page}).then (rs)->
      if rs.status == 1
        $scope.services = rs.data.services
        $scope.total = rs.data.total
        $scope.totalPages = [1..$scope.total]
        $scope.is_full = rs.data.is_full
      else
        alert rs.message

  $scope.loadType = ()->
    ServicesApi.api2({all: 1}).then (rs)->
      if rs.status == 1
        $scope.list_types = rs.data
      else
        alert rs.message

  $scope.setPage = (page)->
    $scope.page = page
    $scope.load()

  $scope.addNewService = ()->
    Modal.action('service_detail','modal-add-new-service', ($scope,modalInstance)->
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

      $scope.reset = ()->
        $scope.service = {}
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
    if servicesId.length == 0
      alert 'Chưa chọn dịch vụ cần xóa'
    else
      ServicesApi.api4({services_id: servicesId}).then (rs)->
        if rs.status == 1
          $scope.load()
        else
          alert rs.message
      return

  $scope.editService = (service)->
    Modal.action('service_detail','modal-edit-service', ($scope,modalInstance)->
      $scope.service = service
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

      $scope.reset = ()->
        id = $scope.service.id
        $scope.service = {}
        $scope.service.id = id
    , ()->
      $scope.load()
    )
    return

  $scope.addNewType = ()->
    Modal.action('service_type','modal-add-new-type', ($scope,modalInstance)->
      $scope.type = {}
      
      $scope.getFile = ()->   
        fileReader.readAsDataUrl($scope.file, $scope).then (result)->
          $scope.type.image = result
          
      $scope.create = (type)->
        console.log type

      $scope.reset = ()->
        $scope.type = {}
    , ()->
      $scope.loadType()
    )
    return 
