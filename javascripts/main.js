$(document).foundation();
$(window).on('load', function () {
	window.scrollTo(0, 0);
});

/*
* PANEL
*/

$('body').find('.panel-header').before('<div class="panel-header-border"/>');


/*
* FOOTER
*/

var footer = $('body').find('footer');
var sticky = typeof footer.data('sticky') !== 'undefined' ? footer.data('sticky') : false;

if (sticky && !Modernizr.touch) {
	$(window).on("load resize", function () {
		var pos = footer.position();
		var height = $(window).height();
		height = height - pos.top;
		height = height - footer.height();
		if (height > 0) {
			footer.css({ 'margin-top': height + 'px' });
		}
	});
}


$(document).ready(function () {

    /*
    * PHOTOSWIPE
    */

    if ($('body').hasClass('gallery')) {
        $('<div/>', {'class': 'overlay'}).appendTo('body');
        var PS = $("#gallery a").photoSwipe({ enableMouseWheel: false, enableKeyboard: false, zIndex: 9999, fadeInSpeed:0 });
        PS.show(0);
    }

});