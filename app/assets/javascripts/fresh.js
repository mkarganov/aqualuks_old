var top_menu_height = 0;
jQuery(function($) {
		$(window).load( function() {
			$('.external-link').unbind('click');
		});

        $(document).ready( function() {

            // load google map
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' +
            'callback=initialize';
        document.body.appendChild(script);

        top_menu_height = $('.aqualuks-top-menu').height();
        // scroll spy to auto active the nav item
        $('body').scrollspy({ target: '#aqualuks-nav-bar', offset: top_menu_height + 10 });
		$('.external-link').unbind('click');

        // scroll to top
        $('#btn-back-to-top').click(function(e){
            e.preventDefault();
            scrollTo('#aqualuks-top');
        });

        // scroll to specific id when click on menu
        $('.aqualuks-top-menu .navbar-nav a').click(function(e){
            e.preventDefault();
            var linkId = $(this).attr('href');
            scrollTo(linkId);
            if($('.navbar-toggle').is(":visible") == true){
                $('.navbar-collapse').collapse('toggle');
            }
            $(this).blur();
            return false;
        });

        // to stick navbar on top
        $('.aqualuks-top-menu ').stickUp();

        // gallery category
        $('.aqualuks-gallery-category a').click(function(e){
            e.preventDefault();
            $(this).parent().children('a').removeClass('active');
            $(this).addClass('active');
            var linkClass = $(this).attr('href');
            $('.gallery').each(function(){
                if($(this).is(":visible") == true){
                   $(this).hide();
                };
            });
            $(linkClass).fadeIn();
        });

        //gallery light box setup
        // $('a.colorbox').colorbox({
                                    // rel: function(){
                                        // return $(this).data('group');

                                    // }
        // });
    });
});

function initialize() {
    myLatLang= new google.maps.LatLng(49.430425, 32.082984)
    var mapOptions = {
      zoom: 16,
      center: myLatLang
    };

    var map = new google.maps.Map(document.getElementById('map-canvas'),  mapOptions);
    var marker = new google.maps.Marker({
    position: myLatLang,
    map: map,
    title: 'TEST'
  })
}

// scroll animation
function scrollTo(selectors)
{

    if(!$(selectors).size()) return;
    var selector_top = $(selectors).offset().top - top_menu_height;
    $('html,body').animate({ scrollTop: selector_top }, 'slow');

}
