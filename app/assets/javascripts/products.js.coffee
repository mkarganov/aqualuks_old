# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$(document).on 'click', "#add_image", (e) ->
  $(e).preventDefault
  $('#product_images_items').append($("#product_images"))
