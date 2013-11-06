# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.carousel').carousel( interval: false )
  $('#welcome-slider > .slider').glide(
    autoplay: false,
    arrows: true,
    nav: false
  )
