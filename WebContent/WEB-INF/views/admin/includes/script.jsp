
<script>
	$(document)
			.ready(
					function() {
						var activeSystemClass = $('.list-group-item.active');

						//something is entered in search form
						$('#system-searchr')
								.keyup(
										function() {
											var that = this;
											// affect all table rows on in systems table
											var tableBody = $('.table-list-search #myTablet'); 
											var tableRowsClass = $('.table-list-search #myTablet tr');
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
						$('#system-searchC')
						.keyup(
								function() {
									var that = this;
									// affect all table rows on in systems table
									var tableBody = $('.table-list-search #myTableco');
									var tableRowsClass = $('.table-list-search #myTableco tr');
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
					
	$('#system-searchT')
	.keyup(
			function() {
				var that = this;
				// affect all table rows on in systems table
				var tableBody = $('.table-list-search #myTableta');
				var tableRowsClass = $('.table-list-search #myTableta tr');
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
	$('#system-searchU')
	.keyup(
			function() {
				var that = this;
				// affect all table rows on in systems table
				var tableBody = $('.table-list-search #myTableu');
				var tableRowsClass = $('.table-list-search #myTableu tr');
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
	$('#system-searchCa')
	.keyup(
			function() {
				var that = this;
				// affect all table rows on in systems table
				var tableBody = $('.table-list-search #myTableca');
				var tableRowsClass = $('.table-list-search #myTableca tr');
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
	$('#system-searchM')
	.keyup(
			function() {
				var that = this;
				// affect all table rows on in systems table
				var tableBody = $('.table-list-search #myTablem');
				var tableRowsClass = $('.table-list-search #myTablem tr');
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
	$('#system-searchG')
	.keyup(
			function() {
				var that = this;
				// affect all table rows on in systems table
				var tableBody = $('.table-list-search #myTableg');
				var tableRowsClass = $('.table-list-search #myTableg tr');
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
	$('#system-searchP')
	.keyup(
			function() {
				var that = this;
				// affect all table rows on in systems table
				var tableBody = $('.table-list-search #myTablep');
				var tableRowsClass = $('.table-list-search #myTablep tr');
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
					});

	$(document).ready(function() {

		$('#myTablet').pageMe({
			pagerSelector : '#myPagert',
			showPrevNext : true,
			hidePageNumbers : false,
			perPage : 6
		});

	});

	$(document).ready(function() {

		$('#myTableco').pageMe({
			pagerSelector : '#myPagerco',
			showPrevNext : true,
			hidePageNumbers : false,
			perPage : 6
		});

	});

	$(document).ready(function() {

		$('#myTableta').pageMe({
			pagerSelector : '#myPagerta',
			showPrevNext : true,
			hidePageNumbers : false,
			perPage : 6
		});

	});

	$(document).ready(function() {

		$('#myTablep').pageMe({
			pagerSelector : '#myPagerp',
			showPrevNext : true,
			hidePageNumbers : false,
			perPage : 6
		});

	});

	$(document).ready(function() {

		$('#myTableg').pageMe({
			pagerSelector : '#myPagerg',
			showPrevNext : true,
			hidePageNumbers : false,
			perPage : 6
		});

	});

	$(document).ready(function() {

		$('#myTablem').pageMe({
			pagerSelector : '#myPagerm',
			showPrevNext : true,
			hidePageNumbers : false,
			perPage : 6
		});

	});

	$(document).ready(function() {

		$('#myTableca').pageMe({
			pagerSelector : '#myPagerca',
			showPrevNext : true,
			hidePageNumbers : false,
			perPage : 6
		});

	});

	$(document).ready(function() {

		$('#myTableu').pageMe({
			pagerSelector : '#myPageru',
			showPrevNext : true,
			hidePageNumbers : false,
			perPage : 6
		});

	});
</script>
