var $glow = $('#glow');
var $txt = $('.txt');
var $w1 = $('#timer');
var $awakening = $('.awakening');
var interval = null;
var $sun = $('div.sun img');
var $main = $('#main');
var $sun_wrapper = $('#sun-wrapper');
var $ie_overlay_trigger = '';

function startSlideshow() {
    $glow.fadeIn(1000)
    .delay(1000)
    .fadeOut(2200, startSlideshow);
}

function showIEMessage() {
	maskOn = true;
	maskOff = false;

	$sun_wrapper.fadeTo("medium", 0.25);
	$w1.hide();
    $awakening.hide();
	$('#ie-overlay').show();
    startSlideshow();
}

function closeIEMessage() {
	maskOn = false;
	maskOff = true;
	
	$sun_wrapper.fadeTo("fast", 1);
	$w1.show();
    $awakening.show();
	$('#ie-overlay').hide();
    startSlideshow();
}

$(document).ready(function() {

	if ($.browser.msie || maskOn) {
		showIEMessage();
	} else {
		closeIEMessage();
	}

    $('.email_label').hide();
    $main.addClass('shrink');

    $sun.hover(function(e) {
		if (maskOff) {
		    $glow.stop(true).fadeTo("fast", 1);
	        $w1.fadeTo("medium", 0);
	        $awakening.fadeTo("medium", 0);

	        var counter = 0;
	        clearInterval(interval);
	        interval = setInterval(function() {
	            if (counter != -360) {
	                counter -= 1;
	                $txt.css({
	                    MozTransform: 'rotate(-' + -counter + 'deg)',
	                    WebkitTransform: 'rotate(-' + -counter + 'deg)',
	                    OTransform: 'rotate(-' + -counter + 'deg)',
	                    transform: 'rotate(-' + -counter + 'deg)',
	                });
	            }

	            if (counter == -360) {
	                counter = 0;
	            }
	        }, 20);

	        $txt.stop().animate({
	            opacity: 1,
	            backgroundSize: '100%'
	        }, 700);						
		}
	

    }, function(e) {

		if (maskOff) {
	        startSlideshow();
	        clearInterval(interval);

	        $txt.stop().animate({
	            backgroundSize: '60%',
	            opacity: '0.1'
	        }, 400);

	        if ($main.hasClass('shrink')) {
	            $awakening.fadeTo("fast", 1);
	            $w1.fadeTo("medium", 1);
	        }			
			
		}	

    });

    $sun.on('click', function(e) {
		if (maskOff) {
	        $main.removeClass('shrink');
	        $sun_wrapper.fadeTo("medium", 0.25);
	        $w1.fadeTo("medium", 0);
	        $awakening.fadeTo("medium", 0);			
		}
    });

    $('.proceed-anyway').on('click', function(e) {
		closeIEMessage();
    });


    $('a.btn-close').on('click', function(e) {
        $main.addClass('shrink');
        $sun_wrapper.fadeTo("fast", 1);
        $w1.fadeTo("fast", 1);
        $awakening.fadeTo("fast", 1);
    });

    var hoverOffRead = true;
    var hoverOffConnect = true;
    var hoverOffPublish = true;
    var delayOnButton = 300;
    var fadeInText	= 500;

    function stopAllTexts() {
        var removeAnimationQueue = true;
        $('.read_text').stop(removeAnimationQueue);
        $('.publish_text').stop(removeAnimationQueue);
        $('.connect_text').stop(removeAnimationQueue);				
        $('.on').stop(removeAnimationQueue, true);
    }

    // this could be default or thankyou.. depending on which one has the on class
    function showOnText() {
        setTimeout(function() {
            if (hoverOffRead && hoverOffConnect && hoverOffPublish) {
                $('.read_text').hide();
                $('.publish_text').hide();
                $('.connect_text').hide();				
                $('.on').fadeIn(fadeInText, function() {
                    $('.on').show();
                });
                $('#email_label').fadeOut(fadeInText, function() {
                    $('#email_label').hide();
                });
            }
        }, delayOnButton); // if on the read button for 0.2 seconds we execute code inside
    }

    $('a.read').hover( // hover read button
        function(e) {
            stopAllTexts();
            hoverOffRead = false;
            setTimeout(function() {
                if (!hoverOffRead && hoverOffConnect && hoverOffPublish) {
                    $('.on').hide();
                    $('.publish_text').hide();
                    $('.connect_text').hide();				
                    $('.read_text').fadeIn(fadeInText, function() {
                        $('.read_text').show();
                    });
                    $('#email_label').fadeIn(fadeInText, function() {
                        $('#email_label').show();
                    });	
                }
            }, delayOnButton); 
        },
        function(e) {
            hoverOffRead = true;
            showOnText();
        }
    );

    $('a.publish').hover( // publish read button
        function(e) {
            stopAllTexts();
            hoverOffPublish = false;
            setTimeout(function() {
                if (hoverOffRead && hoverOffConnect && !hoverOffPublish) {
                    $('.on').hide();
                    $('.read_text').hide();
                    $('.connect_text').hide();				
                    $('.publish_text').fadeIn(fadeInText, function() {
                        $('.publish_text').show();
                    });
                    $('#email_label').fadeIn(fadeInText, function() {
                        $('#email_label').show();
                    });
                }
            }, delayOnButton); // if on the publish button for 0.2 seconds we execute code inside
        },
        function(e) {
            hoverOffPublish = true;
            showOnText();
        }
    );

    $('a.connect').hover( // connect read button
        function(e) {
            stopAllTexts();
            hoverOffConnect = false;
            setTimeout(function() {
                if (hoverOffRead && !hoverOffConnect && hoverOffPublish) {
                    $('.on').hide();
                    $('.read_text').hide();
                    $('.publish_text').hide();				
                    $('.connect_text').fadeIn(fadeInText, function() {
                        $('.connect_text').show();
                    });
                    $('#email_label').fadeIn(fadeInText, function() {
                        $('#email_label').show();
                    });
                }
            }, delayOnButton); // if on the connect button for 0.2 seconds we execute code inside
        },
        function(e) {
            hoverOffConnect = true;
            showOnText();
        }
    );

    $('.email-text').on('hover', function() {
        $(this).find('b').toggleClass('underline');
    });

    $('#placeholder').hover(function() {
        $(this).css('color', '#939598');
    },
    function() {
        $(this).css('color', '#bcbeb0');
    });

    $('input[type=email]').focusin(function() {
        $(this).val('');
    });

    $('input[type=email]').focusout(function() {
        if($(this).val() == '') {
            $(this).val('Your Email...');
        }
    });

    /*
    * Sharing
    *
    */
	var email_desc = "STORYZER is a revolutionary online platform built by story-lovers for story-lovers. It allows you to read stories, publish your own works and connect with all storyzers. \n\nVisit our site for more details. Do leave your email behind to be invited as a beta user when STORYZER launches on Oct 11th, 2012.";
	var short_nhtml_desc = "I signed up for updates to STORYZER http://storyzer.com";
	var fb_description = "STORYZER is a revolutionary online platform built by story-lovers for story-lovers. It allows you to read stories, publish your own works and connect with all storyzers. \n\n Visit our site for more details. Do leave your email behind to be invited as a beta user when STORYZER launches on Oct 11th, 2012.";
	var html_description = "STORYZER is a revolutionary online platform built by story-lovers for story-lovers. It allows you to read stories, publish your own works and connect with all storyzers. <br /><br /> Visit our site for more details. Do leave your email behind to be invited as a beta user when STORYZER launches on Oct 11th, 2012.";
	var short_desc = 'I signed up for updates to <a href="' + fullDomain + '">STORYZER</a>';
    var social_variables = {
        "facebook" : {
            "url" : encodeURIComponent(fullDomain),
            "title" : encodeURIComponent("STORYZER"),
            "summary" : encodeURIComponent(fb_description),
            "thumbnail" : encodeURIComponent(storybotLogo),
            "facebook_url" : "http://www.facebook.com/sharer.php"

        },
        "twitter" : {
            "url" : encodeURIComponent(fullDomain),
            "text" : encodeURIComponent("I signed up for updates to STORYZER"),
            "lang" : "en",
            "hashtags" : encodeURIComponent("madeofstories"),
            "related" : encodeURIComponent("storyzer"),
            "twitter_url" : "https://twitter.com/share",
            "via" : encodeURIComponent("storyzer"),
        },
        "gplus" : {
            "url" : encodeURIComponent(fullDomain),
            "gplus_url" : "https://plus.google.com/share",
            "hl" : "en-US" // language code
        },

        "stumbleupon" : {
            "stumbleupon_url" : "http://www.stumbleupon.com/submit",
            "url" : encodeURIComponent(fullDomain),
            "title" : encodeURIComponent("STORYZER"),
            "tags" : encodeURIComponent("madeofstories")
        },

        "tumblr" : {
            "tumblr_url" : "http://www.tumblr.com/share/link",
            "url" : encodeURIComponent(fullDomain),
            "name" : encodeURIComponent("STORYZER"),
            "description" : encodeURIComponent(html_description),
        },
        "linkedin" : {
            "linkedin_url" : "http://www.linkedin.com/shareArticle",
            "title" : encodeURIComponent("STORYZER"),
            "source" : encodeURIComponent("STORYZER"),
            "summary" : encodeURIComponent(fb_description),
            "url" : encodeURIComponent(fullDomain),
        },
        "livejournal" : {
            "livejournal_url" : "http://www.livejournal.com/update.bml",
            "subject" : encodeURIComponent("STORYZER"),
            "transform" : 1,
            "event" : encodeURIComponent(short_desc + '<br /><br />' + html_description),
        },
        "email" : {
            "body" : encodeURIComponent(short_nhtml_desc + "\n\n" + email_desc),
            "subject" : encodeURIComponent("I signed up for updates to STORYZER. You may be interested in STORYZER as well.")
        }
    };

    var facebook = "{{{facebook.facebook_url}}}?s=100&p[title]={{facebook.title}}&p[summary]={{facebook.summary}}&p[url]={{facebook.url}}&p[images][0]={{facebook.thumbnail}}";
    //console.log($.mustache(facebook, social_variables));
    $('a#fb_share').attr("href", $.mustache(facebook, social_variables));

    var twitter = "{{{twitter.twitter_url}}}?url={{twitter.url}}&via={{{twitter.via}}}&hashtags={{{twitter.hashtags}}}&lang={{twitter.lang}}&related={{twitter.related}}&text={{{twitter.text}}}"
    //console.log($.mustache(twitter, social_variables));
    $('a#tw_share').attr("href", $.mustache(twitter, social_variables));

    var gplus = "{{{gplus.gplus_url}}}?url={{{gplus.url}}}&hl={{{gplus.hl}}}";
    $('a#gp_share').attr("href", $.mustache(gplus, social_variables));

    // see https://developer.linkedin.com/documents/share-linkedin
    var linkedin = "{{{linkedin.linkedin_url}}}?mini=true&url={{{linkedin.url}}}&title={{{linkedin.title}}}&source={{{linkedin.source}}}$summary={{{linked.summary}}}";
    $('a#li_share').attr("href", $.mustache(linkedin, social_variables));

    // see http://4rapiddev.com/internet/share-link-url-of-facebook-twitter-google-plus-stumbleupon-reddit-digg-and-tumblr/
    // 	http://www.stumbleupon.com/submit?url=SHARE_URL&title=SHARE_TITLE
    var stumbleupon = "{{{stumbleupon.stumbleupon_url}}}?url={{{stumbleupon.url}}}&title={{{stumbleupon.title}}}&tags={{{stumbleupon.tags}}}";
    $('a#su_share').attr("href", $.mustache(stumbleupon, social_variables));

    // see http://www.livejournal.com/js/bookmarklet.js to reverse engineer
    var livejournal = "{{{livejournal.livejournal_url}}}?usescheme=nonavigation&event={{{livejournal.event}}}&subject={{{livejournal.subject}}}&transform={{{livejournal.transform}}}";
    $('a#lj_share').attr("href", $.mustache(livejournal, social_variables));
    $('a#lj_share').attr("target", "_blank");

    // see http://www.tumblr.com/examples/share/sharing-links-to-articles.html
    var tumblr = "{{{tumblr.tumblr_url}}}?url={{{tumblr.url}}}&name={{{tumblr.name}}}&description={{{tumblr.description}}}";
    $('a#tb_share').attr("href", $.mustache(tumblr, social_variables));
    $('a#tb_share').attr("target", "_blank");

    var email = "mailto:?subject={{{email.subject}}}&body={{{email.body}}}";
    $('a#email_share').attr("href", $.mustache(email, social_variables));

    // Ajax form submitting and error checking
    $('#mc-embedded-subscribe').on('click', function(e) {

        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        var input = $('#mce-EMAIL').val();

        if(input == '') {
            $("#message").html('<span class="error">Enter your email address before submitting</span>');
            return false;
        }
        else if(!emailReg.test(input)) {
            $("#message").html('<span class="error">Please enter a valid email address</span>');
            return false;
        }
        else {
            emailAddress = escape(input);
        }
    });

    $('#loadingDiv').hide()     // hide it initially
    .ajaxStart(function() {
        $('.on').hide();
        $(this).show();
        })
        .ajaxStop(function() {
            $('.on').show();
            $(this).hide();
            });

            $("#mc-embedded-subscribe-form").submit(function() {
                $("#message").empty();

                $.post("teaser_signups/signup.json", {ajax: true, "email" : emailAddress}, function(data) {
                    // hide the default
                    $('.default').hide();
                    $('.default').removeClass('on');

                    // show thank you			
                    $('.thankyou_text').fadeIn(fadeInText, function() {
                        $('.thankyou_text').show();
            });
            $('.thankyou_text').addClass('on');

            // hide the email textbox
            $('.form-email').hide();
            });
            return false;
            });

            // tooltip
            $('.w3 li img[title]').tooltip();
});
