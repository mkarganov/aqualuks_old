$ ->
  ready = ->
    # $(".form-search .btn").click( ->
    #   # $.get(this.action, $(this).serialize(), null, 'script')
    #   search = $('.search-query', this).val()
    #   $.getScript('/catalogue', { search: search})
    #   # $.getScript({
    #   #   url: '/catalogue',
    #   #   data: {search: search}
    #   # })
    #   return false
    # )

    $(".dropdown-menu a").click ->
      $.getScript(this.href)
      $('.dropdown a span').text($(@).text())
      $('.dropdown-toggle input').attr($(@).data())
      $('#search').val('')
      $('body').click()
      return false

  $(document).ready(ready)
  $(document).on('page:load', ready)

  $(document).on 'submit', '.form-search', ->
    search = $('.search-query', this).val()
    category = $('.dropdown > a input').attr('category')
    $.ajax({
        url: this.action,
        type: 'GET',
        data: {search: search, category_id: category},
        dataType: 'script'
    })
    return false

