$ ->
  $(document).on 'click', 'select', (e) ->
    basic_price = $(@).data('price')
    quantity = $(@).val()
    new_price = basic_price * quantity
    $(@).parents('td').next().text(new_price.toFixed(2))
    calculateTotals()
