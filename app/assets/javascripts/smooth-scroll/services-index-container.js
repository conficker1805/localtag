function services_scroll(direction) {
	var current_section 	= $('.section.stop')
	var finished_animate 	= !current_section.hasClass('running')
	var active_box  			= $(current_section).find(".fly-box.active")
	var active_menu 			= $(current_section).find("li.active")


	if (direction == 'next' && finished_animate) {
		if ($(active_box).next().length > 0) {
			$(current_section).addClass('running')
			$(active_box).removeClass('active').next().addClass('active')
			$(active_menu).removeClass('active').next().addClass('active')

			setTimeout(function(){ $(current_section).removeClass('running') }, 1100)
		}else {
			$(current_section).removeClass('stop')
			setTimeout(function(){ 
				$(current_section).addClass('stop')
				$('.section.stop .fly-box').removeClass('active')
				$('.section.stop .fly-box:first-child').addClass('active')

				$('.section.stop li').removeClass('active')
				$('.section.stop li:first-child').addClass('active')
			}, 1000)
		}
	}

	if (direction == 'prev' && finished_animate) {
		if ($(active_box).prev().length > 0) {
			$(current_section).addClass('running')
			$(active_box).removeClass('active').prev().addClass('active')
			$(active_menu).removeClass('active').prev().addClass('active')
			setTimeout(function(){ $(current_section).removeClass('running') }, 1100)
		}
	}
}