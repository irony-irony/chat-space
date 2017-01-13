$(function(){
  function buildHTML(data) {
    if (message.image) {
      var insertImage = '<br><img src="' + message.image + '">';
      } else {
      var insertImage = '';
      }
    }
    var html =  '<li class = "chat-message">'+
                '<div class = "chat-message__header clearfix">'+
                '<p class = "chat-message__name">'+ data.name +
                '</p><p class = "chat-message__time">'+ data.time +
                '</p></div>'+
                '<p class = "chat-message__body">'+ data.body + insertImage +
                '</p></li>';
    return html;
  }

  $('.new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.message_body');
    var message = textField.val();
    var fd = new FormData($(this)[0]);
    $.ajax({
      type: 'POST',
      url: window.location.href + '.json',
      data: fd,
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat-messages').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
