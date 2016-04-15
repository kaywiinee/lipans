window.Lipans.Service.factory 'ServicesApi', ($http) ->
  path = '/api/v1/'
  factory_api_ctrl = {}

  # define api in this list
  arrAPICtrl =
    api1: 'get'
    api2: 'get'
    api3: 'post'
    api4: 'post'
    api5: 'post'
    api6: 'get'
    api7: 'post'

  $.each arrAPICtrl, (key, method) ->
    factory_api_ctrl[key] = (params) ->
      defer = $.Deferred()
      URL = path + key
      config = if method=='get' then {params: params} else params
      $http[method](URL,config).success((data, status, headers, config) ->
        defer.resolve(data)
      ).error((data, status, headers, config)->
        switch status
          when 404
            message = "Not Found URL : " + URL
          else
            message = data

        defer.resolve({status: status, message: message})
      )
      defer.promise();

  factory_api_ctrl