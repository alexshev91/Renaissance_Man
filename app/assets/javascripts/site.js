$(document).ready(function(){


$('.commentbutton1').on('click', function(event){
  event.preventDefault();
  $(this).nextAll(".commentdiv1").first().toggle();
});
});