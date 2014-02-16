if $('input[value="<%=@id%>"]').parents('tbody').children().length < 2
  window.location = '<%= root_path%>'
else
  product = $('input[value="<%=@id%>"]').parents('tr')
  product.fadeOut(300, ->
    product.remove()
    calculateTotals()
    counter = parseInt($('#count_cart').text())
    $('#count_cart').text(counter-1 + ' items')
  )
  $('#full_cart .total span').text(<%=session[:cart_total]%>)
