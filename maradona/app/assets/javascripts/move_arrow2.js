$(document).ready(function() {
	
	var arrow = $('.arrow-up');
	
	$('.right-sidebar-menu-img').bind('hover', function(event){
		switch(this.id){
			case "excl":
				arrow.css("left", 26);
				break;
			case "check":
				arrow.css("left", 89);
				break;
			case "four":
				arrow.css("left", 152);
				break;
			case "thought":
				arrow.css("left", 222);
				break;
			case "note":
				arrow.css("left", 286);
				break;
			default:
				break;
		}
		
	});
		


});
