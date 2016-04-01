window.Lipans.Service.factory 'Modal', (templateHelper,$modal) ->
  modal =
    action: (tpl_name,class_name,func_ctrl,func_cb)->
      modalInstance = $modal.open(
        templateUrl: templateHelper.get tpl_name
        windowClass: class_name
        keyboard: false
        backdropClick: false
        backdrop: 'true'
        controller: ($scope)->
          func_ctrl($scope,modalInstance)
      )
      modalInstance.result.finally ()->
        func_cb()

      return

  modal