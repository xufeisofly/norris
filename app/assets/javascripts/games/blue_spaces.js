$(document).ready(function() {
  console.log('hahah')
  let bubble_count = $('.bubble').length
  let max_height = $(document).height() - Number($('#blue_space_chat_room').css('bottom').replace('px', ''))
  $('#blue_space_chat_room').css('max-height', String(max_height) + 'px')
  $('#blue_space_chat_room').css('height', String(bubble_count * 40) + 'px')

  let scroll_height = bubble_count * 40
  $('#blue_space_chat_room').animate({ scrollTop: scroll_height }, 1000)

  $('#blue_space_input_box #content').keyup(function(e) {
    console.log('sss')
    if(e.keyCode == 13) {
      $(this).first().val('')
    }
  })
})
