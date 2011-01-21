(function($) {


  $(function() {
    $('pre.prettyprint code').text(function(i, text) {
      return $.trim(text);
    });
    // pretty print code
    prettyPrint();

    // append top links to h3's
    $('#main.general h3')
      .append('<span class="top"><a href="#main">^</a></span>');
  });

})(jQuery);
