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
        var food_name = $("td.name", this).text().replace(/ /g,'').toLowerCase()
        var food_date = $("td.mealtime", this).html().replace(/ /g,'').toLowerCase()
        var food_location = $("td.location", this).text().replace(/ /g,'').toLowerCase()
<<<<<<< HEAD
        if (food_name.includes(target) || food_location == target || food_date == target) {
=======
        if (food_name.includes(target) || food_location.includes(target) || food_date.includes(target)) {
>>>>>>> 400f91e838f79b481e6b5b41f37cbc2c57a29eaf
          $(this).show()
        } else {
          console.log("hiding")
          $(this).hide()
        }
      });
    });
  }
};
<<<<<<< HEAD
$(Search.setup);

=======
$(Search.setup);
>>>>>>> 400f91e838f79b481e6b5b41f37cbc2c57a29eaf
