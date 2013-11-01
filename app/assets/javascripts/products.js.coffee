# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'click', "#add_image a", ->
  a = $('#product_images_form').html().replace(/[[0-9]]/g, new Date().getTime() + ']')
  $('#product_images').append(a)
  return false

$(document).on 'click', '#remove', ->
  row = $(@).parents('li')
  row.find($('.destroy_field input')).val(true)
  row.addClass('hide')
  return false
