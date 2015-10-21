// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function() {

  $("#chat-submit").append("<input id='message' type='text'>");
  $("#chat-submit").append("<button type='submit'>Enter</button>");

  $("button[type=submit]").click(function(){
    $.ajax({
      type: "GET",
      url: "/index.json",
      success: function(data){
        debugger;
        $("#chat-display").append( data.first_name + ": " + $("#message").val() + "<br>");
        $("input[type=text]").val("");
      }
    });
  });

});
