$ ->
  if $('.have-flash').length > 0
    $('#input-name').val('')
    $('#input-email').val('')
    $('#input-phone').val('')
    $('#input-subject').val('')
    $('#input-message').val('')

  $('#input-name').focus()
  arr = ['input-name', 'input-email', 'input-message']
  $.each(arr, (index, value)->
    $('#' + value).bind("keyup paste", ()->
      if value == 'input-email' && $(this).val().match(/^([\w.-]+)@([\w.-]+)\.([a-zA-Z.]{2,6})$/i)
        $(this).removeClass('m-error').removeClass('m-required')
      else if value != 'input-email' && $(this).val().length > 0
        $(this).removeClass('m-error').removeClass('m-required')
      else
        $(this).addClass('m-error').addClass('m-required')

      if $('.m-required').length > 0
        $('.default-form .submit-btn').addClass('btn-disable')
      else
        $('.default-form .submit-btn').removeClass('btn-disable')
    )
  )