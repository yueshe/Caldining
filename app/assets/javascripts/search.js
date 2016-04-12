var Search = {
  setup: function() {
    $( "#search" ).keyup(function(){
      $("tr.food").each(function() {
        var current_row_id = $(this).attr('id')
        var target_id = $('#search').val().replace(/ /g,'').toLowerCase()
        if (current_row_id.includes(target_id)) {
          $(this).show()
        } else {
          $(this).hide()
        }
      });
    });
  }
};
$(Search.setup);