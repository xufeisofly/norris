$(document).ready(function() {
  console.log('ddd')
  $('.sidenav').sidenav()

  // sidenav open
  var instance = M.Sidenav.getInstance($('.sidenav'));
  let currentMousePos = { x: -1, y: -1 }
  $(document).mousemove(event => {
    currentMousePos.x = event.pageX
    currentMousePos.y = event.pageY

    if (currentMousePos.x < 10) {
      instance.open()
    } else if (currentMousePos.x > 300) {
      instance.close()
    }
  })

  // parallax
  $('.parallax').parallax()

  // select
  $('select').formSelect()

  // floating action button
  $('.fixed-action-btn').floatingActionButton({
    hoverEnabled: false
  })

  var totalReadCounter = 0
  if ($('#total-read-max').get(0)) {
    var totalRead = Number($('#total-read-max').get(0).innerHTML)
    var totalReadIntervalId1 = setInterval(function(){
      totalReadCounter += 17
      $('#total-read').html(String(totalReadCounter))
      if (totalReadCounter > totalRead - 20) {
        clearInterval(totalReadIntervalId1);
        var totalReadIntervalId2 = setInterval(function(){
          $('#total-read').html(String(totalReadCounter++))
          if (totalReadCounter > totalRead)
            clearInterval(totalReadIntervalId2);
        }, 50)
      }
    }, 50)
  }
})
