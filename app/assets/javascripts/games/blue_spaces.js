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
//= require_self


$(document).ready(function() {
  let bubble_count = $('.bubble').length
  let max_height = $(document).height() - Number($('#blue_space_chat_room').css('bottom').replace('px', ''))
  $('#blue_space_chat_room').css('max-height', String(max_height) + 'px')
  $('#blue_space_chat_room').css('height', String(bubble_count * 40) + 'px')

  let scroll_height = bubble_count * 40
  $('#blue_space_chat_room').animate({ scrollTop: scroll_height }, 1000)

  $('#blue_space_input_box #content').keyup(function(e) {
    if(e.keyCode == 13) {
      $(this).first().val('')
             .focusout()
    }
  })
})
