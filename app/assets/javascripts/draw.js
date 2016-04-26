var draw = {
  setup: function() {
    
    var food_list = []
    var calories_list = []
    var color_list = []
    var fat_list = []
    var carb_list = []
    $("tr.food").each(function() {
     food_list.push($("td.name", this).text())
     calories_list.push(parseFloat($("td.calories", this).html()) * parseFloat($("td.servings", this).html()))
     carb_list.push(parseFloat($("td.carbs", this).html()) * parseFloat($("td.servings", this).html()))
     fat_list.push(parseFloat($("td.fat", this).html()) * parseFloat($("td.servings", this).html()))
     color_list.push('#'+Math.floor(Math.random()*16777215).toString(16));
    });
    console.log(food_list)
        console.log(calories_list)
            console.log(color_list)
    var ctx = $("#calories_chart");
    var ctx2 = $("#fat_chart");
    var ctx3 = $("#carb_chart");
    var calories_chart = new Chart(ctx, {
    type: 'doughnut',
    data: {
    labels: food_list,
    datasets: [
        {
            data: calories_list,
            backgroundColor: color_list,
            hoverBackgroundColor: color_list
        }]
    }
});
var fat_chart = new Chart(ctx2, {
    type: 'doughnut',
    data: {
    labels: food_list,
    datasets: [
        {
            data: fat_list,
            backgroundColor: color_list,
            hoverBackgroundColor: color_list
        }]
    }
});
 var carb_chart = new Chart(ctx3, {
    type: 'doughnut',
    data: {
    labels: food_list,
    datasets: [
        {
            data: carb_list,
            backgroundColor: color_list,
            hoverBackgroundColor: color_list
        }]
    }
});





  }
};
$(draw.setup);