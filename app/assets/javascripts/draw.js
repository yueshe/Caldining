var curr_chart;
var food_list;
var calories_list;
var color_list;
var fat_list;
var carb_list;

$(document).ready(draw)
var draw =  function() {
    //Data intiation
    food_list = []
    calories_list = []
    color_list = []
    fat_list = []
    carb_list = []
    //Data retreival
    $("tr.food").each(function() {
     food_list.push($("td.name", this).text())
     var addition = parseFloat($("td.calories", this).html()) * parseFloat($("td.servings", this).html()) || 0;
     calories_list.push(addition);
     carb_list.push(parseFloat($("td.carbs", this).html()) * parseFloat($("td.servings", this).html()))
     fat_list.push(parseFloat($("td.fat", this).html()) * parseFloat($("td.servings", this).html()))
     color_list.push('#'+Math.floor(Math.random()*16777215).toString(16));
    });
    //Initial set up
    curr_chart = chart("#calories_chart", food_list, calories_list, color_list)
    
    $("#fat_div").hide()
    $("#carb_div").hide()
    $("#total_calories").text("Total Calories: " + calories_list.reduce(add, 0) + "KCal");
    $("#total_fat").text("Total Fat: " + fat_list.reduce(add, 0) + "g");
    $("#total_carb").text("Total Carbs: " + carb_list.reduce(add, 0) + "g");
    show()
  }


var chart = function(canvas, name, data, color) {
    var ctx = $(canvas);
    var chart = new Chart(ctx, {
    type: 'doughnut',
    data: {
    labels: name,
    datasets: [
        {
            data: data,
            backgroundColor: color,
            hoverBackgroundColor: color
        }]
    }
});
    return chart
}

var show = function() {
    $("#chart_picker").change(function() {
        var chart_type = $("#chart_picker").val()
        curr_chart.clear();
        if (chart_type == "calories") {
            $("#calories_div").fadeIn()
           curr_chart = chart("#calories_chart", food_list, fat_list, color_list)
            $("#fat_div").hide()
            $("#carb_div").hide()
        }   else if (chart_type == "fat") {
            $("#fat_div").fadeIn()
            curr_chart = chart("#fat_chart", food_list, fat_list, color_list)
            $("#calories_div").hide()
            $("#carb_div").hide()
        } else if (chart_type == "carbs") {
            $("#carb_div").fadeIn()
            curr_chart= chart("#carb_chart", food_list, fat_list, color_list)
            $("#calories_div").hide()
            $("#fat_div").hide()
        }
    });
    
  }

function add(a, b) {
    return a + b;
}
