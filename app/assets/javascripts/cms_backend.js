

// get file name on change

$(document).on('click', '.btn-file input', function() {
	$(this).change(function () {
		var stripFile = $(this).val().split('\\').pop();
     	$(this).parents('.parent').find('.show-file').html(stripFile);
	});
});

// turbolink doc ready

$(document).ready(function() {

	// slide meta form inputs

	$('#meta-link').on('click', function(e) {
    	$('.meta-wrap').slideToggle();
     	e.preventDefault();
    });

	// insert new section on form

	$('form').on('click', '.add_new', function(e) {
		var time = new Date().getTime();
	    var regexp = new RegExp($(this).data('id'), 'g');
	    
		$(this).parent().append($(this).data('fields').replace(regexp, time));
		
		e.preventDefault();
		
		return false;
	});

	// remove section from form

	$('form').on('click', '.remove_fields', function(e) {
 		e.preventDefault();
 		$(this).parent().find(".check").prop( "checked", true );
		$(this).closest('.remove-container').hide();
 	});

 	// header inputs slidetoggle

 	$('#show-headliners').click(function(e) {
     	e.preventDefault();
     	$('.headliners').slideToggle();
    });


	$('form').on('click', '.add-content', function(e) {
			e.preventDefault();
			var $parent = $(this).parent().next();
			$parent.find('textarea').addClass('tinymce');
			$parent.find('.editor').slideToggle();
			$('.tinymce').each(function() {
				var id = $(this).attr('id');
				tinyMCE.execCommand('mceAddEditor', false, id);
			});
	});

	// target header input fields
	$('.header-btns').on('click', function (e) {
		e.preventDefault();
		var btnTarget = $(this).attr('id').replace('-btn', ''),
			targetID = '#' + btnTarget;

			$(targetID).addClass('active').siblings().removeClass('active');

			$('.image-list')
				.slideToggle()
				.find('img')
				.each(function () {
					$(this).on('click', function () {
						var imgURL = $(this).attr('src').replace('thumb_', '');
						$('input.active').val(imgURL)
										 .trigger('change');

						$('.image-list').hide();
					});
				});
	});

	// add header content
	$('form').on('click', '.header-content-btn', function (e) {
		e.preventDefault();
		$('.form-header textarea').slideToggle();
	});

	// section backgorund select
	$('form').on('click', '.section-background-btn', function (e) {
		e.preventDefault();
		

			var btnTarget = $(this).parents('.remove-container');

			$(btnTarget).attr('id', 'active').siblings().removeAttr('id'); 

			$('.image-list')
				.slideToggle()
				.find('img')
				.each(function () {
					$(this).on('click', function () {
						var imgURL = $(this).attr('src').replace('thumb_', '');
						$('#active').find('input.section-background').val(imgURL)
										 .trigger('change');

						$('#active').find('.img-placeholder').show().addClass('show').find('img').attr('src', imgURL)

						$('.image-list').hide();
					});
				});
	});

	// close the image list
	$('.close-modal').on('click', function (e) {
		e.preventDefault();
		$(this).parent().hide();
	});

	// listen to input change
	$('#header-background').change(function () {
		var imgURL = $(this).val().replace('thumb_', '');
		$('.form-header').css('background-image', 'url(' + imgURL + ')');
	});

	$('#header-icon').change(function () {
		var imgURL = $(this).val().replace('thumb_', '');
		$('.form-header-icon').attr('src', imgURL);
	});


	// insert templates into editor


	$('form').on('click', '.tmp-link', function (e) {
	    e.preventDefault();
	    alert('click');
	    var findTemplate = $(this).attr('data');
	    var getTemplate = '#' + findTemplate;
	    var targetTemplate = $(getTemplate).html();
	    tinyMCE.activeEditor.insertContent(targetTemplate);
	});





	// prevent form submit without title input

 	if ($("#page_permalink").val() == '') {
        $("#page_permalink").val('Enter a Title');
        $('.preset').addClass('verify');
    }

    $('#page_permalink').focus(function() {
    	if ($(this).val() == 'Enter a Title') {
    		$(this).val('');
    	} 
    });

	// verify title input remove cover

	$('#page_permalink').blur(function() {
		var titleRegex = /^[A-Za-z]+$/;
		var title = $(this).val();

		if ((titleRegex.test(title))) {
			$('.preset').removeClass('verify');
			$('.show-title-verify').hide();
		} else {
			$('.preset').addClass('verify');
			$('.show-title-verify').show();
		}
	});

	// toggle nested nav items

	$('.nested-link').on('click', function(e) {
		e.preventDefault();
		$(this).parent().find('.nested').slideToggle();
	});

	// hide scroll to top button

    $('#scroll').hide();

    // show and animate top scroll

	$(window).scroll(function() {
		if($(this).scrollTop() > 100) {
			$('#scroll').fadeIn();
		} else {
			$('#scroll').fadeOut();
		}
	});

	$('#scroll').on('click', function () {
		$('body, html').animate({
			scrollTop: 0
		}, 800);
		return false;
	});

	// media asset info

	$('.toggle-info').on('click', function (e) {
		e.preventDefault();
		$(this).parents('.row').find('.panel').slideToggle();
	});

	

});

// global delete confirmation

$(document).on('click', '.btn-delete', function(e) {
	e.preventDefault();
	$(this).html() == "Delete" ? $(this).html('Cancel') : $(this).html('Delete');
	$(this).parent().find('.delete-confirm').slideToggle();
});

// slide nav on/off

$(document).on('click', '#toggle-nav', function (e) {
	e.preventDefault();
	$('aside.wrapper, .main-wrapper, .nav-bg').toggleClass('slide');
});

// global panel body toggle

$(document).on( 'click', '.close-body', function(e) {
	var $this = $(this);
	e.preventDefault();
	$this.parents('.panel').find('.panel-body').slideToggle();
	$this.toggleClass('fa-angle-down fa-angle-up');
});
