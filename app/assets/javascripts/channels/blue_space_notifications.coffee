App.blue_space_notifications = App.cable.subscriptions.create "BlueSpaceNotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#blue_space_chat_room').append data['message']
    bubble_count = $('.bubble').length
    # reset the height of the chat room
    $('#blue_space_chat_room').css('height', String(bubble_count * 40) + 'px')
    # auto scroll to the bottom of the chat room
    max_height = $(document).height() - Number($('#blue_space_chat_room').css('bottom').replace('px', ''))
    $('#blue_space_chat_room').css('max-height', String(max_height) + 'px')
    
    scroll_height = bubble_count * 40
    $('#blue_space_chat_room').animate({ scrollTop: scroll_height }, 1000)

