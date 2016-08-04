$(document).ready(function(){
  
  var $creatures = $('.home-creature-wrapper');
  
  $('#creature_filter_name').on("keyup", function(){
    var $currentName = this.value;
        
    $creatures.each(function(index, creature){
      if ($(creature).data("name").toLowerCase().indexOf($currentName) !== -1 ){
        $(creature).show();
      } else {
        $(creature).hide();
      };
    });
  });
})