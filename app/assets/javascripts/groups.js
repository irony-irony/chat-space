$(function(){
   var preName;
   var preFunc;

   // USER-LIST
   function buildUser(users) {
     var html='';
     $.each(users, function(index, user) {
       html += '<div class="chat-group-user clearfix">' +
       '<p class="chat-group-user__name">' + user.name + '</p>' +
       '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' + user.id + '" data-user-name="' + user.name + '">追加</a></div>';

     });

     return html;
   }

   // ADD-GROUP-MEMBER
   function groupMember(id, name){
     var html = '<div class="chat-group-user clearfix" id="chat-group-user-' + id + '">' +
     '<input type="hidden" name="group[user_ids][]" value="' + id + '">' +
     '<p class="chat-group-user__name">' + name + '</p>' +
     '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id="' + id + '">削除</a></div>';

     return html;
   }

   // INCREMENTAL-SEARCH
   $(document).on('keyup', '.chat-group-form__input', function() {
     var name = $(this).val();
     var ajaxPost = function(){
       $.ajax({
         type: 'GET',
         url: '/users/search',
         data: {
           name: name
         },
         dataType: 'json',
       })
       .done(function(data) {
         var html = buildUser(data);
         $('#user-search-result').html(html);
       })
       .fail(function() {
         alert("ERROR");
       });
     };

     if (name != preName && name.length !== 0){
       clearTimeout(preFunc);
       preFunc = setTimeout(ajaxPost, 500);
     }
     preName = name;
   });

   // ADD-BUTTON
   $(document).on('click', '.user-search-add', function(){
     var id = $(this).attr('data-user-id');
     var name = $(this).attr('data-user-name');
     $(this).parent().hide();
     var html = groupMember(id, name);
     $('#chat-group-users').append(html);
   });

   // DELETE-BUTTON
   $(document).on('click', '.user-search-remove', function(){
     var id = $(this).attr('data-user-id');
     $('.user-search-add[data-user-id=' + id + ']').parent().show();
     $(this).parent().remove();
   });
 });
