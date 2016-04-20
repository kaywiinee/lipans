window.Lipans.App.controller 'ServicesCtrl', ($scope,$element,ServicesApi,Modal,fileReader) ->
  'use strict'

  $scope.init = ()->
    $scope.page = 1
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
    ServicesApi.api2({all: 1,type: 'service'}).then (rs)->
      if rs.status == 1
        $scope.list_types = rs.data
      else
        alert rs.message

  $scope.setPage = (page)->
    $scope.page = page
    $scope.load()

  $scope.addNewService = ()->
    Modal.action('service_detail','modal-add-new-service', ($scope,modalInstance)->
      ServicesApi.api2({type: 'service'}).then (rs)->
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

  $scope.editService = ($event,service)->
    if $($event.target).hasClass('service_id')
      return
    else
      Modal.action('service_detail','modal-edit-service', ($scope,modalInstance)->
        $scope.service = service
        ServicesApi.api2({type: 'service'}).then (rs)->
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
    if $scope.list_types.length >= 5
      alert 'Số service đã đạt mức tối đa, không thể tạo thêm nữa.'
    else
      Modal.action('service_type','modal-add-new-type', ($scope,modalInstance)->
        $scope.type = {}
        
        $scope.getFile = ()->   
          fileReader.readAsDataUrl($scope.file, $scope).then (result)->
            $scope.type.image_url = result
            
        $scope.create = (type)->
          type.kind = 'service'
          ServicesApi.api5(type).then (rs)->
            if rs.status == 1
              modalInstance.dismiss('cancel')
            else
              $scope.error = rs.status

        $scope.reset = ()->
          $scope.type = {}
          $('.type-image').attr('src', '')
          $('.type-image-input').val('')
      , ()->
        $scope.loadType()
      )
      return

  $scope.editType = (type)->
    Modal.action('service_type','modal-edit-type', ($scope,modalInstance)->
      $scope.type = type

      $scope.getFile = ()->   
        fileReader.readAsDataUrl($scope.file, $scope).then (result)->
          $scope.type.image_url = result

      $scope.create = (type)->
        type.kind = 'service'
        ServicesApi.api5(type).then (rs)->
          if rs.status == 1
            modalInstance.dismiss('cancel')
          else
            $scope.error = rs.status

      $scope.reset = ()->
        id = $scope.type.id
        $scope.type = {}
        $('.type-image').attr('src', '')
        $('.type-image-input').val('')
        $scope.type.id = id
    , ()->
      $scope.loadType()
    )
    return
