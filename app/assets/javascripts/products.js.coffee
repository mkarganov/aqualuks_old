# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'click', "#add_image a", ->
    a = $('#product_images_form').html().replace(/[[0-9]]/g, new Date().getTime() + ']')
    $('#product_images').append(a)
    return false

  $(document).on 'click', '#remove', ->
    row = $(@).parents('li')
    row.find($('.destroy_field input')).val(true)
    row.addClass('hide')
    return false

  ready = ->
    glide = $('#image-preview-modal > .slider').glide({
        autoplay: false,
        arrows: true,
        arrowMainClass: 'carousel-control',
        arrowRightClass: 'right',
        arrowLeftClass: 'left',
        arrowRightText: '›',
        arrowLeftText: '‹',
        nav: false
      }).data('api_glide')
      $('.modal').hide()
      $('#preview li').click ->
        glide.jump($(this).index() + 1)
        $('#image-preview-modal').modal()
  $(document).ready(ready)
  $(document).on('page:load', ready)
