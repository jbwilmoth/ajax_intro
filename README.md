# AJAX

Asynchronous JavaScript and XML (AJAX) is used to perform HTTP requests in the background.  Upon completion of the request, you can use JavaScript (in our case jQuery) to update the Document with the returned data.

We will be using jQuery's Ajax functions to perform the requests.

	$.ajax(); // Provides the most flexibility for making the request
	$.get();  // Short hand for $.ajax with defaults for a GET request
	$.post(); // Short hand for $.ajax with defaults for a POST request
	
In this exercise we use the $.get() and $.post() methods.

## Arguments

Both the $.get() and $.post() methods take the same argumets:

* URL (required) - the location of the server resource for a GET request, or the location that will process the submission on a POST.
* data - Information that will be appended to the request as query parameters for a GET request, or added to the body as a URL Encoded Form submission for a POST request.
* success(data, status, jqXHR) - Callback executed when the request is returned from the server.  In most cases, we only need the data portion of the parameters.
* dataType - This dictates what parsing rules are used to read in the data returned from the server.  By default jQuery will try to infer what to use.

### $.get()

In this example we:

* attach a click handler to a link
* tell the browser not to follow the link
* execute an AJAX GET request to fetch the resource located at the url in the link's href attribute.
* append the response from the server to the body of the page

Code:
	
	$('a').click(function(event){
		event.preventDefault();
		var url = $(this).attr('href');
		
		$.get(url, function(response){
			$('body').append(response);
		});
	});
	

### $.post()
In this example we:

* attach a submit event to a form
* tell the browser not to submit the form
* execute a POST
* append the response from the server to the body of the document

Example:

	$('form').submit(function(event){
		event.preventDefault();
		var url = $(this).attr('action');
		var data = $(this).serialize();
		
		$.post(url, data, function(response){
			$('body').append(response);
		});
	});
