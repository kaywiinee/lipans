window.Lipans.App.directive "postImage",()->
  return {
    restrict: 'A',
    link: ($scope,el, attrs)->
      el.bind("change", (e)->
        $scope.file = (e.srcElement || e.target).files[0]
        $scope.getFile()
      )
  }
