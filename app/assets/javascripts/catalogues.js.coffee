$ ->
  ready = ->
    $(".form-search").submit( ->
      $.get(this.action, $(this).serialize(), null, 'script')
      return false
    )
  $(document).ready(ready)
  $(document).on('page:load', ready)
