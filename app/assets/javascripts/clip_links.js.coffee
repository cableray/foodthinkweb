$(document).ready ()->
	$('.unclipped .clip > a').bind 'click', (event)->
		event.preventDefault
		$.ajax 
			type: 'PUT'
			url: this.href
			data: 
	    dataType: 'json'
	    success: (response)->
				this.attr('data-method','delete')
				this.html('delete')
