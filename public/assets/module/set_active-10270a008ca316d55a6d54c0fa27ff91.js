(function() {
  $(function() {
    var location, type;
    location = window.location.href.split('/')[3];
    switch (location) {
      case 'tat-ca-san-pham':
        return $('header #all-products').addClass('m-active');
      case 'loai-san-pham':
        $('header #type').addClass('m-active');
        type = window.location.href.split('/')[4];
        return $('.type-product' + type).addClass('m-active');
      case 'lien-he':
        return $('header #contacts').addClass('m-active');
      default:
        return $('#home').addClass('m-active');
    }
  });

}).call(this);
