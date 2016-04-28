$(document).ready(Search)
var Search = function(){
    $("#search").keydown(function(e){
    if (e.keyCode == 13)
    {
        e.preventDefault();
    }
    });
    
    $( "#search" ).keyup(function(){
      $("tr.food").each(function() {
        var target = $('#search').val().replace(/ /g,'').toLowerCase()
        var food_name = $("td.name", this).text().replace(/ /g,'').toLowerCase()
        var food_date = $("td.mealtime", this).html().replace(/ /g,'').toLowerCase()
        var food_location = $("td.location", this).text().replace(/ /g,'').toLowerCase()
        if (food_name.includes(target) || food_location == target || food_date == target) {
          $(this).show()
        } else {
          console.log("hiding")
          $(this).hide()
        }
      });
    });
}
