#ckeditor init (put ck-editor to use)
window.Lipans.App.directive 'ckEditor', ->
  {
    require: '?ngModel'
    link: (scope, elm, attr, ngModel) ->
      ck = CKEDITOR.replace(elm[0], toolbar: 'mini', contentsCss : '/assets/admin/ckeditor.css.scss')
      if !ngModel
        return
      ck.on 'pasteState', ->
        scope.$apply ->
          ngModel.$setViewValue ck.getData()
          return
        return

      ngModel.$render = (value) ->
        ck.setData ngModel.$viewValue
        return

      ck.on 'instanceReady', ->
        ck.setData ngModel.$viewValue
        return

      return

  }