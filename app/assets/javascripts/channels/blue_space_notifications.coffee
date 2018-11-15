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
    $('#blue_space_chat_room').animate({ scrollTop: 767 }, 1000)
