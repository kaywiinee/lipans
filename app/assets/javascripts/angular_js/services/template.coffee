window.Lipans.Service.factory 'templateHelper', ($templateCache) ->
  path = '/tpl?path=/tpl/'

  # define template using
  arrTemplate = {
    service_detail: 'service/detail',
    service_type: 'service/type',
    blog_detail: 'blog/detail'
  }
  $.each arrTemplate, (key,url) ->
    $templateCache.put key,path + url

  $templateCache