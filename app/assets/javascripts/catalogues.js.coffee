$ ->
  $(document).on 'click', '#filter .dropdown-menu a', ->
    $.getScript(this.href)
    $('#filter a span').text($(@).text())
    $('#filter .dropdown-toggle input').attr($(@).data())
    $('#search').val('')
    $('#sort span').text($('#sort li:first').text())
    $('body').click()
    return false

  $(document).on 'click', '#sort .dropdown-menu a', ->
    category = $('#filter a input').attr('category')
    $.ajax({
      url: this.href,
      type: 'GET',
      data: {category_id: category}
      dataType: 'script'
    })
    $('#sort a span').text($(@).text())
    $('#sort input').attr($(@).data())
    $('#search').val('')
    $('body').click()
    return false


  $(document).on 'submit', '.form-search', ->
    search = $('.search-query', this).val()
    category = $('#filter a input').attr('category')
    sort = $('#sort input').attr('sort')
    direction = $('#sort input').attr('direction')
    $.ajax({
        url: this.action,
        type: 'GET',
        data: {search: search, category_id: category, sort: sort, direction: direction},
        dataType: 'script'
    })
    return false

