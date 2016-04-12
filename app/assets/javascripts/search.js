var Search = {
  setup: function() {
    $("#search").keydown(function(e){
    if (e.keyCode == 13)
    {
        e.preventDefault();
    }
    });
    
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