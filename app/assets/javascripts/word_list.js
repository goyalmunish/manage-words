// display a loading message while waiting for the returning AJAX request
$(document).on('page:fetch', function () {
    $('#loading').show();
});
$(document).on('page:change', function () {
    $('#loading').hide();
});

//
