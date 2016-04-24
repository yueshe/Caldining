var Add_to_diet = {
  setup: function() {
     $(".add").click(function(e){
       var amount = $(".quantity",this.parentNode).val()
       if (amount == "") {
         alert("Please enter an valid amount")
         e.stopImmediatePropagation();
         return
       }
       e.stopImmediatePropagation();
     });
  }
};
$(Add_to_diet.setup);
