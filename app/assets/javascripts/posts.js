var ready = function() {
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
}

$(document).ready(ready)
