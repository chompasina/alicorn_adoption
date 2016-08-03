$(document).ready(function(){
  
  var $creatures = $('.home-creature-wrapper');
  
  $('#creature_filter_name').on("keyup", function(){
    var $currentName = this.value;
        
    $creatures.each(function(index, creature){
      // alert("searching " + $(creature).data("name") + " for " + $currentName)
      if ($(creature).data("name").indexOf($currentName) !== -1 ){
        $(creature).show();
      } else {
        $(creature).hide();
      };
    });
  });
})