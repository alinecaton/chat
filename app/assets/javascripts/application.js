//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $('input#chat_message_content').keyup(function() {
    $('#total_chars').html($('#chat_message_content').val().length);
  });

  setInterval(function() {
    updateHistory();
  }, 1000);
});

function updateHistory() {
  $.get('/chat_messages/history', {}, function(data) {
    $('#history').html(data);
  });
}