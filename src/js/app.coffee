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

# analytics
$('.company').click ->
  id = $(this).data('id')
  if id == 'bench'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'bench'

  else if id == 'expensify'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'expensify'

  else if id == 'bond'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'bond'

  else if id == 'zapier'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'zapier'

  else if id == 'pana'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'pana'

  else if id == 'calendly'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'calendly'

  else if id == 'dialpad'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'dialpad'

  else if id == 'uberconference'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'uberconference'

  else if id == 'zenefits'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'zenefits'

  else if id == 'gusto'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'gusto'

  else if id == 'slack'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'slack'

  else if id == 'sendbloom'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'sendbloom'

  else if id == 'streak'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'streak'

  else if id == 'moo'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'moo'

  else if id == 'intercom'
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'click'
      eventLabel: 'intercom'

  else
    ga 'send',
      hitType: 'event'
      eventCategory: 'companyView'
      eventAction: 'noClick'
      eventLabel: 'missing'
