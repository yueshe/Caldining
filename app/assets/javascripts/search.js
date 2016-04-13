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
        var target = $('#search').val().replace(/ /g,'').toLowerCase()
        var food_name = $("td.name", this).html().replace(/ /g,'').toLowerCase()
        var food_timeframe = $("td.timeframe", this).html().replace(/ /g,'').toLowerCase()
        var food_location = $("td.location", this).html().replace(/ /g,'').toLowerCase()
        if (food_name.includes(target) || food_location == target || food_timeframe == target) {
          $(this).show()
        } else {
          $(this).hide()
        }
      });
    });
  }
};
$(Search.setup);