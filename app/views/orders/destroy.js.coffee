if $('input[value="<%=@id%>"]').parents('tbody').children().length < 2
  window.location = '<%= root_path%>'
else
  a = $('input[value="<%=@id%>"]').parents('tr')
  a.fadeOut(300, ->
    a.remove()
  )
