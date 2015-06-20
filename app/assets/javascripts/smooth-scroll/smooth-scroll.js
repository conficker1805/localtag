$(document).ready(function(){
	init_scroll()

	// Set event scroll down
	$('#next').click(function(){
		next();
	});

	// Set event scroll up
	$('#prev').click(function(){
		prev();
	});


	function next() {
		staying_footer = !$('.section').hasClass('active');
		staying_stop_section = $('.active').hasClass('stop');

		if (staying_footer || staying_stop_section) {
			return
		}else {
			var current = $('.section.active')
			update_active_section(current, true)	// true = scroll down

			var variable = current.attr('data-next')

			run_animate(variable)
		}
	}

	function prev() {
		var is_first_section = $('.section').first().hasClass('active')

		if (is_first_section) {
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

		run_animate(variable)
	}

	function run_animate(variable){
		$('#next').unbind('click')
		$('#prev').unbind('click')

		setTimeout(function(){ 
			$('#next').bind('click', next) 
			$('#prev').bind('click', prev) 
		}, 1100)

		$('.banner-wrap, main, footer').css({ '-moz-transform': 'translate(0, ' + variable + 'px)', '-ms-transform': 'translate(0, ' + variable + 'px)', '-webkit-transform': 'translate(0, ' + variable + 'px)', 'transform': 'translate(0, ' + variable + 'px)', '-moz-transform': 'translate3d(0, ' + variable + 'px, 0)', '-ms-transform': 'translate3d(0, ' + variable + 'px, 0)', '-webkit-transform': 	'translate3d(0, ' + variable + 'px, 0)', 'transform': 'translate3d(0, ' + variable + 'px, 0)',});
	}

	function update_active_section(current, direction) {
		if (direction) {
			var has_next_node = $(current).next().length > 0 ? true : false;
			if (has_next_node)
				$(current).next().addClass('active')
		}else {
			var has_prev_node = $(current).prev().length > 0 ? true : false;
			if (has_prev_node)
				$(current).prev().addClass('active')
		}
		$(current).removeClass('active')
	}

	function init_scroll() {
		var height_main_menu = $('header .navbar').height();
		var sections = $(".section");

		sections.each(function() {
			// Determine next position
			if ($(this).next().length > 0) 
				$(this).attr('data-next', '-' + ($(this).next().offset().top - height_main_menu));
			else {
				var scroll_to_footer = $(this).prev().attr('data-next') - $('footer').height() + $(window).height() - $(this).height() - height_main_menu;
				$(this).attr('data-next', scroll_to_footer);	// Last section scroll to footer
			}

			// Determine previous position
			$(this).attr('data-prev', '-' + ($(this).offset().top - height_main_menu));
		});

		sections.removeClass('active');
		sections.first().addClass('active').attr('data-prev', 0);
	}

	$(window).on('mousewheel DOMMouseScroll', function (e) { 
		// Check direction
	  var direction = (function () {
      var delta = (e.type === 'DOMMouseScroll' ? e.originalEvent.detail * -40 : e.originalEvent.wheelDelta);
      return delta > 0 ? 'next' : 'prev';
    }());

		if ($(document).find('.services-index-container').length) {
			services_scroll(direction);
		}

		$('#' + direction).trigger('click')
	});

	$(window).resize(function() {
	  if ($(window).scrollTop() != 0) {
	  	$(window).animate({scrollTop:0}, '500');
	  }else {
	  	variable = 0
	  	$('.banner-wrap, main, footer').css({ '-moz-transform': 'translate(0, ' + variable + 'px)', '-ms-transform': 'translate(0, ' + variable + 'px)', '-webkit-transform': 'translate(0, ' + variable + 'px)', 'transform': 'translate(0, ' + variable + 'px)', '-moz-transform': 'translate3d(0, ' + variable + 'px, 0)', '-ms-transform': 'translate3d(0, ' + variable + 'px, 0)', '-webkit-transform': 	'translate3d(0, ' + variable + 'px, 0)', 'transform': 'translate3d(0, ' + variable + 'px, 0)',});
	  }

	  setTimeout(function(){
	  	init_scroll();
	  }, 1100);
	});
});
