(function ($) {
    function getViewportHeight() {
        var height = window.innerHeight; // Safari, Opera
        var mode = document.compatMode;

        if ((mode || !$.support.boxModel)) { // IE, Gecko
            height = (mode == 'CSS1Compat') ?
            document.documentElement.clientHeight : // Standards
            document.body.clientHeight; // Quirks
        }

        return height;
    }

    $(window).scroll(function () {
        var vpH = getViewportHeight(),
            scrolltop = (document.documentElement.scrollTop ?
                document.documentElement.scrollTop :
                document.body.scrollTop),
            elems = [];

        // naughty, but this is how it knows which elements to check for
        $.each($.cache, function () {
            if (this.events && this.events.inview) {
                elems.push(this.handle.elem);
            }
        });

        if (elems.length) {
            $(elems).each(function () {
                var $el = $(this),
                    top = $el.offset().top,
                    height = $el.height(),
                    inview = $el.data('inview') || false;

                if (scrolltop > (top + height) || scrolltop + vpH < top) {
                    if (inview) {
                        $el.data('inview', false);
                        $el.trigger('inview', [false]);
                    }
                } else if (scrolltop < (top + height)) {
                    if (!inview) {
                        $el.data('inview', true);
                        $el.trigger('inview', [true]);
                    }
                }
            });
        }
    });

    $(function () {
        $(window).scroll();
    });
})(jQuery);

/*
    Animate elements - May 30, 2015
    (c) 2015 http://wwww.styles.net.vn
*/

$(function () {
    jQuery('.effect_fadeInDowndelay').bind('inview', function (event, visible) {
        if (visible == true) {
            jQuery(this).delay(500).addClass("animated fadeInDowndelay");
        } else {
            jQuery(this).delay(500).removeClass("animated fadeInDowndelay");
        }

    });
    jQuery('.effect_fadeInDown').bind('inview', function (event, visible) {
        if (visible == true) {
            jQuery(this).addClass("animated fadeInDown");
        } else {
            jQuery(this).removeClass("animated fadeInDown");
        }

    });

    //Animate fadeInLeft
    jQuery('.effect_fadeInLeft').one('inview', function (event, visible) {
        if (visible == true) {
            jQuery(this).addClass("animated fadeInLeft");
        } else {
            jQuery(this).removeClass("animated fadeInLeft");
        }
    });
    //Animate fadeInRight
    jQuery('.effect_fadeInRight').one('inview', function (event, visible) {
        if (visible == true) {
            jQuery(this).addClass("animated fadeInRight");
        } else {
            jQuery(this).removeClass("animated fadeInRight");
        }
    });

    //animate first team member
    jQuery('#first-person').bind('inview', function (event, visible) {
        if (visible == true) {
            jQuery('#first-person').addClass("animated pulse");
        } else {
            jQuery('#first-person').removeClass("animated pulse");
        }
    });

    //animate sectond team member
    jQuery('#second-person').bind('inview', function (event, visible) {
        if (visible == true) {
            jQuery('#second-person').addClass("animated pulse");
        } else {
            jQuery('#second-person').removeClass("animated pulse");
        }
    });

    //animate thrid team member
    jQuery('#third-person').bind('inview', function (event, visible) {
        if (visible == true) {
            jQuery('#third-person').addClass("animated pulse");
        } else {
            jQuery('#third-person').removeClass("animated pulse");
        }
    });

    //Animate price columns
    jQuery('.price-column, .testimonial').bind('inview', function (event, visible) {
        if (visible == true) {
            jQuery(this).addClass("animated fadeInDown");
        } else {
            jQuery(this).removeClass("animated fadeInDown");
        }
    });

    //Animate contact form
    //jQuery('.contact-form').bind('inview', function (event, visible) {
    //    if (visible == true) {
    //        jQuery('.contact-form').addClass("animated bounceIn");
    //    } else {
    //        jQuery('.contact-form').removeClass("animated bounceIn");
    //    }
    //});

    //Animate skill bars
    jQuery('.skills > li > span').one('inview', function (event, visible) {
        if (visible == true) {
            jQuery(this).each(function () {
                jQuery(this).animate({
                    width: jQuery(this).attr('data-width')
                }, 3000);
            });
        }
    });
});