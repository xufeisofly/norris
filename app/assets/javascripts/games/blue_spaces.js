// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require turbolinks
//= require cable
//= require serviceworker-companion
//= require_self


$(document).ready(function() {
  let bubble_count = $('.bubble').length
  let bubble_line_height = $('.bubble').height()
  let max_height = $(document).height() - Number($('#blue_space_chat_room').css('bottom').replace('px', ''))
  $('#blue_space_chat_room').css('max-height', String(max_height) + 'px')
  $('#blue_space_chat_room').css('height', String(bubble_count * bubble_line_height) + 'px')

  let scroll_height = bubble_count * bubble_line_height
  // 不知道为什么手机上scroll_height高度不够，乘以一个系数吧
  let error_efficient = 1.2
  $('#blue_space_chat_room').animate({ scrollTop: scroll_height * error_efficient }, 1000)

  $('#content').keyup(function(e) {
    if(e.keyCode == 13) {
      let content = $('#content').first().val()
      let id = $('#content').first().attr('data-id')
      $.ajax({
        url: `/games/blue_spaces/${id}/answer.js`,
        type: 'POST',
        dataType: 'script',
        data: {content: content},
      })
      .done(function() {
        console.log("success");
        $('#content').first().val('')
        $('#content').blur()
      })
      .fail(function() {
        $('#content').blur()
        console.log("error");
      })
    }
  })
})
