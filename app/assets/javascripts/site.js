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
      // console.log(action);

      $.ajax({
        type: 'post',
        url: action,
        data: {comment: {content: text}}
        }
      ).success(function(data) {
        // alert(data.content);
        // debugger;
        if(text.length>200 && text.length<1000){
        post.prepend("<div class=\"well well-sm cmnt\" style=\"margin: 0 auto; width: 100%; font-family: \"Times New Roman\", Times, serif; height: 50px;\" >" + data.content + "</div >");
        text = post.find("textarea").val("");
      } else {
        post.prepend("<div class=\"well well-sm error\" style=\"margin: 0 auto; width: 100%; font-family: \"Times New Roman\", Times, serif; height: 50px; color: red;\" >" +"Comment is either too short or too long. It must be greater than 200 and less than 1000 characters for you to increase your score!" + "</div >");
      }
      });
  });



});