$(document).on("page:fetch", function() {
	$('.loader').show();
});

$(document).on("page:receive", function() {
	$('.loader').hide();
});



$(document).ready(function() {


		$('.nav-links a').each(function() {
			if ($(this).attr('href') === window.location.pathname) {
				var $this = $(this);
				$this.parent().siblings('li').removeClass('current-link');
				$this.parent().addClass('current-link');
				$this.on('click', function(e) {
					e.preventDefault();
				});

				var linkColor = $(this).parent().css('background-color');

				$('.content').css( {
					'border-color' : linkColor
				});

			} 
			
		});

		

		if (window.location.pathname === '/') {
			$('.nav-links').hover(function () {
				var $color = $(this).css('background-color');
				
				$('.content').css({
					'border-color' : $color
				});
			});
		}

		$('#menu-link').on('click', function(e) {
			e.preventDefault();
			$('nav').toggleClass('activate');
		});

		$('.extend-break h1').on('click', function() {
			$('#home-newsletter').slideToggle();
		});

		$('.video-link').on('click', function(e) {
			e.preventDefault();
			$('.video-wrap').slideToggle();
		});

		$('.link-top a').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});

		$('#show-mobile').on('click', function(e) {
			e.preventDefault();
			$('.mobile-wrap').toggleClass('slide');
		});

		function createSidebarLi(json){
		  return ('<a class="map-links">' + json.name + '</a>');
		};

		var mapStyle = [{"featureType":"landscape","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"poi","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"stylers":[{"hue":"#000000"},{"saturation":-100}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"visibility":"on"},{"lightness":50}]},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":0}]}]

		function bindLiToMarker($li, marker){
		  $li.on('click', function(){
		    handler.getMap().setZoom(16);
		    marker.setMap(handler.getMap()); //because clusterer removes map property from marker
		    marker.panTo();
		    google.maps.event.trigger(marker.getServiceObject(), 'click');
		  })
		};

		function createSidebar(json_array){
		  _.each(json_array, function(json){
		    var $li = $( createSidebarLi(json) );
		    $li.appendTo('#sidebar_container');
		    bindLiToMarker($li, json.marker);
		  });
		};

		handler = Gmaps.build('Google');
		handler.buildMap({ 
			provider: {
				draggable:false,
				scrollwheel:false,
				panControl:true,
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				styles: mapStyle
			},

			internal: {
				id: 'sidebar_builder'
			}

			}, function(){
		  	var json_array = [
			    { lat: 33.408429, lng: -104.517887, picture: { url: "images/map-logo.png", width:  36, height: 36 }, name: 'I\'m in Roswell', infowindow: "Ritter & Company <br> 400 E. College Blvd. <br> Roswell, NM 88201 <br><a class='directions btn btn-default' href='https://maps.google.com?saddr=Current+Location&daddr=400+E+College+Blvd+Roswell+NM+88202' target=_blank>Get Directions</a>" },
			    { lat: 32.841478, lng: -104.400092, picture: { url: "images/map-logo.png", width:  36, height: 36 }, name: 'I\'m in Artesia', infowindow: "Ritter & Company <br> 118 Roselawn <br> Artesia, NM 88211 <br><a class='directions btn btn-default' href='https://maps.google.com?saddr=Current+Location&daddr=118+Roselawn+Artesia+NM+88211' target=_blank>Get Directions</a>" }
			    
		  	];

			  var markers = handler.addMarkers(json_array);

			  _.each(json_array, function(json, index){
			    json.marker = markers[index];
			  });

			  createSidebar(json_array);
			  handler.bounds.extendWith(markers);
			  handler.fitMapToBounds();
			});


			$('#sidebar_container').on('click', 'a', function() {
				$(this).siblings('.map-links').removeClass('current-map');
				$(this).toggleClass('current-map');
			});
});


