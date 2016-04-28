var Add_to_diet = {
  setup: function() {
     $(".add").click(function(e){
       var amount = $(".quantity",this.parentNode).val()
       var item = $(".name",this.parentNode).val()
       if (amount.isInteger() && amount >= 1) {
          //$.ajax({
          //type: "GET",
          //url: "/items/:id/add_items",
          //data: {id: item, quantity: amount}
        //});
       } else {
        alert("Please enter an valid amount")
        e.stopImmediatePropagation();
        return
       }
       e.stopImmediatePropagation();
     });
  }
};
$(Add_to_diet.setup);