(function($) {


  $(function() {
    $('pre.prettyprint code').each(function() {
      var $code = $(this);
      var text  = [];
      var lines = $code.text().split("\n");
      var i = 0, sub, match, line;
      for (; i < lines.length; i++) {
        line = lines[i];
        if (i === 0 || !sub) {
          match = line.match(/^(\s+)?(.*)$/);
          if (match) {
            sub = match[1] ? match[1].length : 0;
            text.push(match[2]);
          } else if (!line.match(/^\s*$/)) { // its not whitespace
            text.push(line);
          }
        } else {
          text.push(line.substr(sub));
        }
      }
      $code.text(text.join("\n"));
    });
    // pretty print code
    prettyPrint();

    // append top links to h3's
    $('#main.general h3')
      .append('<span class="top"><a href="#main">^</a></span>');
  });

})(jQuery);
