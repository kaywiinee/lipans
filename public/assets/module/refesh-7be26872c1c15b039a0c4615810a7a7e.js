(function() {
  $(function() {
    if ($('.have-flash').length > 0) {
      $('#input-name').val('');
      $('#input-email').val('');
      $('#input-phone').val('');
      $('#input-subject').val('');
      return $('#input-message').val('');
    }
  });

}).call(this);
