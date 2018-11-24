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
  let bubble_line_height = Number($('.bubble').css('line-height').replace('px', ''))
  let max_height = $(document).height() - Number($('#blue_space_chat_room').css('bottom').replace('px', ''))
  $('#blue_space_chat_room').css('max-height', String(max_height) + 'px')
  $('#blue_space_chat_room').css('height', String(bubble_count * bubble_line_height) + 'px')

  let scroll_height = bubble_count * bubble_line_height
  $('#blue_space_chat_room').animate({ scrollTop: scroll_height }, 1000)

  $('#content').keyup(function(e) {
    if(e.keyCode == 13) {
      $('#content').blur()
      let content = $(this).first().val()
      let id = $(this).first().attr('data-id')
      $.ajax({
        url: `/games/blue_spaces/${id}/answer.js`,
        type: 'POST',
        dataType: 'script',
        data: {content: `我: ${content}`},
      })
      .done(function() {
        console.log("success");
        $('#content').first().val('')
      })
      .fail(function() {
        console.log("error");
      })
    }
  })
})
