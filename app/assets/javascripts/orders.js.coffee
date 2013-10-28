calculateTotals = ->
  total = 0
  $('.price').each((i)->
    total += parseFloat($(@).text())
  )
  $("#total-price").text(total)

$(document).on 'keyup change', 'input', (e) ->
  basic_price = $(@).data('price')
  quantity = $(@).val()
  new_price = basic_price * quantity
  $(@).parents('td').next().text(new_price)
  calculateTotals()


