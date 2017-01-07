$(function(){
  function buildHTML(data) {
    var name = $('h5').text();
    var time = data.created_at;
    var body = data.body;
    var html =  '<li class = "chat-message">'+
                '<div class = "chat-message__header clearfix">'+
                '<p class = "chat-message__name">'+name+
                '</p><p class = "chat-message__time">'+time+
                '</p></div>'+
                '<p class = "chat-message__body">'+body+
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
