window.Lipans.App.controller 'BlogsCtrl', ($scope,$element,ServicesApi,Modal) ->

  $scope.init = ()->
    $scope.page = 1
    $scope.load()

  $scope.load = ()->
    ServicesApi.api6({page: $scope.page}).then (rs)->
      if rs.status == 1
        $scope.blogs = rs.data.blogs
        $scope.total = rs.data.total
        $scope.totalPages = [1..$scope.total]
        $scope.is_full = rs.data.is_full
      else
        alert rs.message

  $scope.addNewBlog = ()->
    Modal.action('blog_detail','modal-add-new-blog', ($scope,modalInstance)->
      ServicesApi.api2({type: 'blog'}).then (rs)->
        if rs.status == 1  
          $scope.types = rs.data
        else
          alert rs.message

      $scope.create = (blog)->
        ServicesApi.api7(blog).then (rs)->
          console.log rs
          if rs.status == 1
            modalInstance.dismiss('cancel')
          else
            $scope.error = rs.status

      $scope.reset = ()->
        $scope.blog = {}
    , ()->
      if $scope.is_full == 1
        $scope.page += 1
      $scope.load()
    )
    return

  $scope.editBlog = ($event,blog)->
    if $($event.target).hasClass('blog_id')
      return
    else
      Modal.action('blog_detail','modal-edit-blog', ($scope,modalInstance)->
        $scope.blog = blog
        ServicesApi.api2({type: 'blog'}).then (rs)->
            if rs.status == 1
              $scope.types = rs.data
            else
              alert rs.message
        
        $scope.create = (blog)->
          ServicesApi.api7(blog).then (rs)->
            if rs.status == 1
              modalInstance.dismiss('cancel')
            else
              $scope.error = rs.status

        $scope.reset = ()->
          id = $scope.blog.id
          $scope.blog = {}
          $scope.blog.id = id
      , ()->
        $scope.load()
      )
      return