var ready = function() {
  console.log('hahah')
  $('.bubble').each(function() {
    let id = Number(this.id.replace('bubble-', ''))
    let bottom_px = String(id * 40) + 'px'
    $(this).css('bottom', bottom_px)
  })
}

$(document).ready(ready)
