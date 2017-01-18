$(function(){
  $.ajaxSetup({
    beforeSend: function(xhr) {
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
    }
  });

  function buildHTML(data) {
    if (data.image) {
      var insertImage = '<br><img src="' + data.image.url + '">';
      } else {
      var insertImage = '';
      }
    var html =  '<li class = "chat-message">'+
                '<div class = "chat-message__header clearfix">'+
                '<p class = "chat-message__name">'+ data.name +
                '</p><p class = "chat-message__time">'+ data.time +
                '</p></div>'+
                '<p class = "chat-message__body">'+ data.body + insertImage +
                '</p></li>';
    return html;
  };


  $('.new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.message_body');
    var message = textField.val();
    var fd = new FormData($(this)[0]);
    $.ajax({
      type: 'POST',
      url: window.location.href,
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

   // URLがgroups/num/messagesのページに於いて自動更新
  var searchUrl = document.location.href.match(/\/groups\/\d+\/messages/);
  if (searchUrl) {
    setInterval(function(){
      $.ajax({
        url: window.location.href + '.json',
        method: 'GET',
        dataType: 'json'
      })
      .done(function(data){
        console.log(data);
        var dbCount = data.db.length;
        var screenCount = $('li.chat-message').length;
        if (screenCount != dbCount) {
          $('li.chat-message').remove();
          for (var i = 0; i < dbCount; i++) {
            var html = buildHTML(data.db[i]);
            $('ul.chat-messages').append(html);
            $('.chat-group__link').find('p.chat-group__message').text(data.db[i].body);
          }
        }
      })
      .fail(function(){
        alert('error');
      });
    }, 10 * 1000);
  }
});
