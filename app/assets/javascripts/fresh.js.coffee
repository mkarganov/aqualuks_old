top_menu_height = 0
$ ->
  $(window).load ->
  $(".external-link").unbind "click"

  $(document).ready ->

    # load google map
    script = document.createElement("script")
    script.type = "text/javascript"
    script.src = "https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&" + "callback=initialize"
    document.body.appendChild script
    top_menu_height = $(".aqualuks-top-menu").height()

    # scroll spy to auto active the nav item
    $("body").scrollspy
      target: "#aqualuks-nav-bar"
      offset: top_menu_height + 10

    $(".external-link").unbind "click"

    $('#home-title').fadeIn(6000)

    # scroll to top
    $("#btn-back-to-top").click (e) ->
      e.preventDefault()
      scrollTo "#aqualuks-top"


    # scroll to specific id when click on menu
    $(".aqualuks-top-menu .navbar-nav a").click (e) ->
      e.preventDefault()
      linkId = $(@).attr("href")
      scrollTo linkId
      $(".navbar-collapse").collapse "toggle"  if $(".navbar-toggle").is(":visible") is true
      $(@).blur()
      false


    # to stick navbar on top
    $(".aqualuks-top-menu ").stickUp()

    # gallery category
    $(".aqualuks-gallery-category a").click (e) ->
      e.preventDefault()
      $(this).parent().children("a").removeClass "active"
      $(this).addClass "active"
      linkClass = $(this).attr("href")
      $(".gallery").each ->
        $(this).hide()  if $(this).is(":visible") is true

      $(linkClass).fadeIn()

this.initialize = ->
  myLatLang = new google.maps.LatLng(49.430425, 32.082984)
  mapOptions =
    zoom: 16
    center: myLatLang
    scrollwheel: false

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  marker = new google.maps.Marker(
    position: myLatLang
    map: map
    title: "TEST"
  )

# scroll animation
this.scrollTo = (selectors) ->
  return unless $(selectors).size()
  selector_top = $(selectors).offset().top - top_menu_height
  $("html,body").animate
    scrollTop: selector_top, "slow"
