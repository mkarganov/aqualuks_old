$ ->
  $('.carousel').carousel( interval: false )

  $(document).on 'click', '#menu li', (e)->
    # (e).preventDefault()
    unless $(e.target).parents('li').find('ul.dropmenu').css('display') == 'block'
      $('.dropmenu').slideUp()
    $(@).find('.dropmenu').slideToggle()
  $(document).click( (e)->
    if $(e.target).parents('#menu').is($('#menu'))
      # return false
    else
      $('.dropmenu').slideUp()
  )
