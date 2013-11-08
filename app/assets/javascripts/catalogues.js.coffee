$ ->
  $(".form-search").submit( ->
    $.get(this.action, $(this).serialize(), null, 'script')
    return false
  )
