var Add_to_diet = {
  setup: function() {
     $(".add").click(function(e){
       var amount = parseInt($(".quantity",this.parentNode).val())
       console.log(amount)
       var item = $(".name",this.parentNode).val()
       if (amount >= 1) {
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