

$(document).ready(function(){
	// Set variables
	var height_main_menu = $('header .navbar').height()

	// Initialize flag (keep params to scroll)
	//$('#scrollTo').attr({'data-prev': '0', 'data-curr': '0', 'data-next': '-' + next_node, })
	var sections = $(".section");
	var temp = 1

	sections.each(function() {
		$(this).attr('data-scroll', temp);

		// Determine next position
		if ($(this).next().length > 0) 
			$(this).attr('data-next', '-' + ($(this).next().offset().top - height_main_menu)) 
		else {
			var scroll_to_footer = $(this).prev().attr('data-next') - $('footer').height() + $(window).height() - $(this).height() - height_main_menu
			$(this).attr('data-next', scroll_to_footer)	// Last section scroll to footer
		}

		// Determine previous position
		$(this).attr('data-prev', '-' + ($(this).offset().top - height_main_menu))

		temp++;
	});

	sections.first().addClass('active').attr('data-prev', 0)


	// Set event scroll down
	$('#next').click(function(){
		next()
	});

	// Set event scroll up

	$('#prev').click(function(){
		prev()
	});


	function next() {
		if (!$('.section').hasClass('active')) {
			return	// You are staying at footer
		}else {
			var current = $('.section.active')
			update_active_section(current, true)	// true = scroll down

			var variable = current.attr('data-next')

			disable_scroll()
			$('main, footer').css({ '-moz-transform': 'translate(0, ' + variable + 'px)', '-ms-transform': 'translate(0, ' + variable + 'px)', '-webkit-transform': 'translate(0, ' + variable + 'px)', 'transform': 'translate(0, ' + variable + 'px)', '-moz-transform': 'translate3d(0, ' + variable + 'px, 0)', '-ms-transform': 'translate3d(0, ' + variable + 'px, 0)', '-webkit-transform': 	'translate3d(0, ' + variable + 'px, 0)', 'transform': 'translate3d(0, ' + variable + 'px, 0)',});
		}
	}

	function prev() {

		if ($('.section').hasClass('active') && $('.section.active').prev().length == 0) {
			return
		}
		else if ($('.section').hasClass('active')) {
			var current = $('.section.active')

			update_active_section(current, false) // false = scroll up

			var variable = current.prev().attr('data-prev')

		}else {
			var variable = $('.section').last().prev().attr('data-next')
			$('.section').last().addClass('active')
		}

		disable_scroll()
		$('main, footer').css({ '-moz-transform': 'translate(0, ' + variable + 'px)', '-ms-transform': 'translate(0, ' + variable + 'px)', '-webkit-transform': 'translate(0, ' + variable + 'px)', 'transform': 'translate(0, ' + variable + 'px)', '-moz-transform': 'translate3d(0, ' + variable + 'px, 0)', '-ms-transform': 'translate3d(0, ' + variable + 'px, 0)', '-webkit-transform': 	'translate3d(0, ' + variable + 'px, 0)', 'transform': 'translate3d(0, ' + variable + 'px, 0)',});

	}

	function disable_scroll(){
		$('#next').unbind('click')
		$('#prev').unbind('click')

		setTimeout(function(){ 
			$('#next').bind('click', next) 
			$('#prev').bind('click', prev) 
		}, 1100)
	}

	function update_active_section(current, direction) {
		if (direction) {
			var has_next_node = $(current).next().length > 0 ? true : false
			if (has_next_node)
				$(current).next().addClass('active')
		}else {
			var has_prev_node = $(current).prev().length > 0 ? true : false
			if (has_prev_node)
				$(current).prev().addClass('active')
		}

		$(current).removeClass('active')
	}



























	$(window).on('mousewheel DOMMouseScroll', function (e) { 

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
