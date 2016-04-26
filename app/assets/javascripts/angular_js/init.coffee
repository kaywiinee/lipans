window.Lipans = {}
window.Lipans.App = angular.module('Lipans',[
  'ngAnimate'
  'ngResource'
  'ngSanitize'
  'ui.router',
  'ui.bootstrap',
  'Service'
])
  .config ($provide, $httpProvider) ->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] =
      angular.element(document.querySelector('meta[name=csrf-token]')).attr('content')

window.Lipans.Service = angular.module('Service',[])
