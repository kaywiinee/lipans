$ ->
  location = window.location.href.split('/')[3]
  switch location
    when 'tat-ca-san-pham'
      $('header #all-product').addClass('m-active')
    when 'loai-san-pham'
      $('header #type').addClass('m-active')
      type = window.location.href.split('/')[4]
      $('.type-product'+type).addClass('m-active')
    else
      $('#home').addClass('m-active')