$ ->
  location = window.location.href.split('/')[3]
  location_admin = window.location.href.split('/')[4]
  
  switch location
    when 'tat-ca-san-pham'
      $('header #all-products').addClass('m-active')
    when 'loai-san-pham'
      $('header #type').addClass('m-active')
      type = window.location.href.split('/')[4]
      $('.type-product'+type).addClass('m-active')
    when 'dich-vu'
      $('header #service').addClass('m-active')
    when 'bai-viet'
      $('header #blog').addClass('m-active')
      type = window.location.href.split('/')[4]
      $('.type-blog'+type).addClass('m-active')
    when 'lien-he'
      $('header #contacts').addClass('m-active')
    else
      $('#home').addClass('m-active')

  switch location_admin
    when 'services'
      $('ul.menu #services').addClass('active')
    when 'blogs'
      $('ul.menu #blogs').addClass('active')
    else
      $('ul.menu #home').addClass('active')