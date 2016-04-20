window.Lipans.App.controller 'BlogsCtrl', ($scope,$element,ServicesApi,Modal) ->

  $scope.init = ()->
    $scope.page = 1
    $scope.load()
    $scope.loadType()

  $scope.load = ()->
    ServicesApi.api6({page: $scope.page}).then (rs)->
      if rs.status == 1
        $scope.blogs = rs.data.blogs
        $scope.total = rs.data.total
        $scope.totalPages = [1..$scope.total]
        $scope.is_full = rs.data.is_full
      else
        alert rs.message

  $scope.loadType = ()->
    ServicesApi.api2({all: 1,type: 'blog'}).then (rs)->
      if rs.status == 1
        $scope.list_types = rs.data
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

  $scope.deleteBlog = ()->
    blogsId = []
    angular.forEach($element.find('.blog_id:checked'), (e)->
      blogsId.push(e.value)
    )
    if blogsId.length == 0
      alert 'Chưa chọn bài viết cần xóa'
    else
      ServicesApi.api8({blogs_id: blogsId}).then (rs)->
        if rs.status == 1
          $scope.load()
        else
          alert rs.message
      return

  $scope.addNewType = ()->
    if $scope.list_types.length >= 5
      alert 'Số service đã đạt mức tối đa, không thể tạo thêm nữa.'
    else
      Modal.action('blog_type','modal-add-new-type', ($scope,modalInstance)->
        $scope.type = {}
        
        $scope.create = (type)->
          type.kind = 'blog'
          ServicesApi.api5(type).then (rs)->
            if rs.status == 1
              modalInstance.dismiss('cancel')
            else
              $scope.error = rs.status

        $scope.reset = ()->
          $scope.type = {}
      , ()->
        $scope.loadType()
      )
      return

  $scope.editType = (type)->
    Modal.action('blog_type','modal-edit-type', ($scope,modalInstance)->
      $scope.type = type

      $scope.create = (type)->
        
        type.kind = 'blog'
        ServicesApi.api5(type).then (rs)->
          if rs.status == 1
            modalInstance.dismiss('cancel')
          else
            $scope.error = rs.status

      $scope.reset = ()->
        id = $scope.type.id
        $scope.type = {}
        $scope.type.id = id
    , ()->
      $scope.loadType()
    )
    return
