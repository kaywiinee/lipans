window.Lipans.Service.factory 'templateHelper', ($templateCache) ->
  path = '/tpl?path=/tpl/'

  # define template using
  arrTemplate = {
    add_new_service: 'service/new'
  }
  $.each arrTemplate, (key,url) ->
    $templateCache.put key,path + url

  $templateCache