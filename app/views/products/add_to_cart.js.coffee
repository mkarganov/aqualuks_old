<% if @new_item %>
  counter = parseInt($('#count_cart').text())
  $('#count_cart').text(counter+1 + ' items')
<% end %>
