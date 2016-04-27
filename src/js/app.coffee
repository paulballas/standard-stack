$('.company').click ->
  id = $(this).data('id')
  $("##{id}").show()
  $('.glass-panel').removeClass('fadeOut').addClass('animated fadeIn')
  $('.popover-view').removeClass('slideOutLeft delayed').addClass('animated slideInLeft')
  $('.popover-items').removeClass('slideOutLeft').addClass('animated slideInLeft delayed')

$('.glass-panel, .close').click ->
  $('.glass-panel').removeClass('fadeIn').addClass('animated fadeOut')
  $('.popover-view').removeClass('slideInLeft').addClass('animated slideOutLeft delayed')
  $('.popover-items').removeClass('slideInLeft delayed').addClass('animated slideOutLeft')
  setTimeout (->
    $('.popover').hide()
  ), 1000
