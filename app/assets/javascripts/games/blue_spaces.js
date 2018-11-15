(function() {
  console.log('hahah')
  let bubble_count = $('.bubble').length
  let max_height = $(document).height() - Number($('#blue_space_chat_room').css('bottom').replace('px', ''))
  $('#blue_space_chat_room').css('max-height', String(max_height) + 'px')
  $('#blue_space_chat_room').css('height', String(bubble_count * 40) + 'px')
})();
