$ ->
  $(document).on 'click', 'select', (e) ->
    basic_price = $(@).data('price')
    quantity = $(@).val()
    new_price = basic_price * quantity
    $(@).parents('td').next().text(new_price.toFixed(2))
    new_total = calculateTotals()
    $('#order_total').val(new_total.text())

  $(document).on 'input', '#find_product', (e) ->
    result = $.ajax({
      url: '/admin/orders/11/find_products',
      type: 'GET',
      data: {search: e.target.value}
    })

  $(document).on 'click', '.remove', ->
    $(@).parent().fadeOut( ->
      $(@).find('.destroy').val('true')
      new_total = calculateTotals()
      $('#order_total').val(new_total.text()))
