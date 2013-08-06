$(function(){

  $('#create-contact').click(function(event){
    // Brower...I got this
    event.preventDefault();

    // Hide the link for creating new contacts
    $(this).hide();

    // Go get that form
    var location = $(this).attr('href');
    $.get(location, function(server_response){
      $('.container').append(server_response);
    });

  });

  // Bind a submission event to the form
  $('.container').on('submit', '#new-contact', function(event){
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $(this).serialize();

    $.post(url, data, function(server_response){
      console.log(arguments);
      console.log(server_response);
      $('tbody').append(server_response);
    });

    $(this).remove();
    $('#create-contact').show();
  })

});
