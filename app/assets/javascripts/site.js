$(document).ready(function(){


  $('.commentbutton1').on('click', function(event){
    event.preventDefault();
    $(this).nextAll(".commentdiv1").first().toggle();
  });

  $(".new_comment").on("submit", function(event) {
    event.preventDefault();
      // debugger;
      var action = this.attributes.action.value;
      var post = $(this);
      var text = post.find("textarea").val();
      // var params = {content: text};
      console.log(action);
      $.ajax({
        type: 'post',
        url: action,
        data: {comment: {content: text}}
        }
      ).success(function(data) {
        // alert(data.content);
        // debugger;
        post.prepend("<div class=\"well well-sm\" style=\"margin: 0 auto; width: 100%;\">" + data.name +" "+ data.content + "</div >");
        text = post.find("textarea").val("");
      });
  });



});