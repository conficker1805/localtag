

$(document).ready(function(){
	// Set variables
	var height_main_menu = $('header .navbar').height()
	var next_node = $('section[data-scroll].next').offset().top - height_main_menu
	var total = $('section[data-scroll]').size
	// Initialize flag (keep params to scroll)
	$('#scrollTo').attr({'data-prev': '0', 'data-curr': '0', 'data-next': '-' + next_node, })

	// Set event scroll down
	$('#next').click(function(){
		next()
	});

	// Set event scroll up
	$('#prev').click(function(){
		var val_b = '0'
		$('main, footer').css({
			'-moz-transform': 		'translate(0, ' + val_b + ')',
		  '-ms-transform': 			'translate(0, ' + val_b + ')',
		  '-webkit-transform': 	'translate(0, ' + val_b + ')',
		  'transform': 					'translate(0, ' + val_b + ')',
		  '-moz-transform': 		'translate3d(0, ' + val_b + ', 0)',
		  '-ms-transform': 			'translate3d(0, ' + val_b + ', 0)',
		  '-webkit-transform': 	'translate3d(0, ' + val_b + ', 0)',
		  'transform': 					'translate3d(0, ' + val_b + ', 0)',
		});
	});












	function next() {
		if (($('section.prev').length > 0) && $('section.next').length <= 0) {
			// It is last section then scroll to footer
			var variable = $('#scrollTo').attr('data-next') - $('footer').height() + $(window).height() - $('section').last().height() - height_main_menu
			$('main, footer').css({ '-moz-transform': 'translate(0, ' + variable + 'px)', '-ms-transform': 'translate(0, ' + variable + 'px)', '-webkit-transform': 'translate(0, ' + variable + 'px)', 'transform': 'translate(0, ' + variable + 'px)', '-moz-transform': 'translate3d(0, ' + variable + 'px, 0)', '-ms-transform': 'translate3d(0, ' + variable + 'px, 0)', '-webkit-transform': 	'translate3d(0, ' + variable + 'px, 0)', 'transform': 'translate3d(0, ' + variable + 'px, 0)',});
			return
		}else {
			$('#next').unbind('click')
			//$('#prev').unbind('click')
			
			var variable = $('#scrollTo').attr('data-next')

			$('main, footer').css({ '-moz-transform': 'translate(0, ' + variable + 'px)', '-ms-transform': 'translate(0, ' + variable + 'px)', '-webkit-transform': 'translate(0, ' + variable + 'px)', 'transform': 'translate(0, ' + variable + 'px)', '-moz-transform': 'translate3d(0, ' + variable + 'px, 0)', '-ms-transform': 'translate3d(0, ' + variable + 'px, 0)', '-webkit-transform': 	'translate3d(0, ' + variable + 'px, 0)', 'transform': 'translate3d(0, ' + variable + 'px, 0)',});

			setTimeout(function(){ 
				$('#next').bind('click', next) 

				// Get position of next section
				$('section').removeClass('prev')
				var current = $('section[data-scroll].next')
				current.removeClass('next')
				current.prev().addClass('prev')
				if (current.next().length) {
					current.next().addClass('next')

					// Set flag
					var new_position = $('#scrollTo').attr('data-next') - $('section[data-scroll].next').offset().top + height_main_menu

					$('#scrollTo').attr('data-next', new_position)
				}
			}, 1300)
		}

	}













	$(window).on('mousewheel DOMMouseScroll', function (e) { 
	  var scrollable = !$('html,body').is(':animated')


		// Check direction
	  var direction = (function () {
	      var delta = (e.type === 'DOMMouseScroll' ?
	                   e.originalEvent.detail * -40 :
	                   e.originalEvent.wheelDelta);

	      return delta > 0 ? true : false;
	    }());


	  if (direction) {
	  	$('#next').trigger('click')
	  }else {
	  	$('#prev').trigger('click')
		}
	  
	});
});
