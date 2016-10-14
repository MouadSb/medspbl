
	


<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>

<script>
	$(document)
			.ready(
					function() {
						var activeSystemClass = $('.list-group-item.active');

						//something is entered in search form
						$('#system-search')
								.keyup(
										function() {
											var that = this;
											// affect all table rows on in systems table
											var tableBody = $('.table-list-search tbody');
											var tableRowsClass = $('.table-list-search tbody tr');
											$('.search-sf').remove();
											tableRowsClass
													.each(function(i, val) {

														//Lower text for case insensitive
														var rowText = $(val)
																.text()
																.toLowerCase();
														var inputText = $(that)
																.val()
																.toLowerCase();
														if (inputText != '') {
															$(
																	'.search-query-sf')
																	.remove();
															tableBody
																	.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
																			+ $(
																					that)
																					.val()
																			+ '"</strong></td></tr>');
														} else {
															$(
																	'.search-query-sf')
																	.remove();
														}

														if (rowText
																.indexOf(inputText) == -1) {
															//hide rows
															tableRowsClass
																	.eq(i)
																	.hide();

														} else {
															$('.search-sf')
																	.remove();
															tableRowsClass
																	.eq(i)
																	.show();
														}
													});
											//all tr elements are hidden
											if (tableRowsClass
													.children(':visible').length == 0) {
												tableBody
														.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
											}
										});
					});
	$.fn.pageMe = function(opts) {
		var $this = this, defaults = {
			perPage : 7,
			showPrevNext : false,
			hidePageNumbers : false
		}, settings = $.extend(defaults, opts);

		var listElement = $this;
		var perPage = settings.perPage;
		var children = listElement.children();
		var pager = $('.pager');

		if (typeof settings.childSelector != "undefined") {
			children = listElement.find(settings.childSelector);
		}

		if (typeof settings.pagerSelector != "undefined") {
			pager = $(settings.pagerSelector);
		}

		var numItems = children.size();
		var numPages = Math.ceil(numItems / perPage);

		pager.data("curr", 0);

		if (settings.showPrevNext) {
			$('<li><a href="#" class="prev_link">Précedent</a></li>').appendTo(pager);
		}

		var curr = 0;
		while (numPages > curr && (settings.hidePageNumbers == false)) {
			$('<li><a href="#" class="page_link">' + (curr + 1) + '</a></li>')
					.appendTo(pager);
			curr++;
		}

		if (settings.showPrevNext) {
			$('<li><a href="#" class="next_link">Suivant</a></li>').appendTo(pager);
		}

		pager.find('.page_link:first').addClass('active');
		pager.find('.prev_link').hide();
		if (numPages <= 1) {
			pager.find('.next_link').hide();
		}
		pager.children().eq(1).addClass("active");

		children.hide();
		children.slice(0, perPage).show();

		pager.find('li .page_link').click(function() {
			var clickedPage = $(this).html().valueOf() - 1;
			goTo(clickedPage, perPage);
			return false;
		});
		pager.find('li .prev_link').click(function() {
			previous();
			return false;
		});
		pager.find('li .next_link').click(function() {
			next();
			return false;
		});

		function previous() {
			var goToPage = parseInt(pager.data("curr")) - 1;
			goTo(goToPage);
		}

		function next() {
			goToPage = parseInt(pager.data("curr")) + 1;
			goTo(goToPage);
		}

		function goTo(page) {
			var startAt = page * perPage, endOn = startAt + perPage;

			children.css('display', 'none').slice(startAt, endOn).show();

			if (page >= 1) {
				pager.find('.prev_link').show();
			} else {
				pager.find('.prev_link').hide();
			}

			if (page < (numPages - 1)) {
				pager.find('.next_link').show();
			} else {
				pager.find('.next_link').hide();
			}

			pager.data("curr", page);
			pager.children().removeClass("active");
			pager.children().eq(page + 1).addClass("active");

		}
	};

	$(document).ready(function() {

		$('#myTable').pageMe({
			pagerSelector : '#myPager',
			showPrevNext : true,
			hidePageNumbers : false,
			perPage : 6
		});

	});

	(function ( $ ) {

		$.fn.bootstrapSwitch = function( options ) {

			var settings = $.extend({
				on: 'On',
				off: 'Off	',
				onLabel: '&nbsp;&nbsp;&nbsp;',
				offLabel: '&nbsp;&nbsp;&nbsp;',
				same: false,//same labels for on/off states
				size: 'md',
				onClass: 'primary',
				offClass: 'default'
				}, options );

			settings.size = ' btn-'+settings.size;
			if (settings.same){
				settings.onLabel = settings.on;
				settings.offLabel = settings.off;
			}

			return this.each(function(e) {
				var c = $(this);
				var disabled = c.is(":disabled") ? " disabled" : "";

				var div = $('<div class="btn-group btn-toggle" style="white-space: nowrap;"></div>').insertAfter(this);
				var on = $('<button class="btn btn-primary '+settings.size+disabled+'" style="float: none;display: inline-block;"></button>').html(settings.on).css('margin-right', '0px').appendTo(div);
				var off = $('<button class="btn btn-danger '+settings.size+disabled+'" style="float: none;display: inline-block;"></button>').html(settings.off).css('margin-left', '0px').appendTo(div);

				function applyChange(b) {
					if(b) {
						on.attr('class', 'btn active btn-' + settings.onClass+settings.size+disabled).html(settings.on).blur();
						off.attr('class', 'btn btn-default '+settings.size+disabled).html(settings.offLabel).blur();
					}
					else {
						on.attr('class', 'btn btn-default '+settings.size+disabled).html(settings.onLabel).blur();
						off.attr('class', 'btn active btn-' + settings.offClass+settings.size+disabled).text(settings.off).blur();
					}
				}
				applyChange(c.is(':checked'));

				on.click(function(e) {e.preventDefault();c.prop("checked", !c.prop("checked")).trigger('change')});
				off.click(function(e) {e.preventDefault();c.prop("checked", !c.prop("checked")).trigger('change')});

				$(this).hide().on('change', function() {
					applyChange(c.is(':checked'))
				});
			});
		};
	} ( jQuery ));
		
</script>
