$(document).ready (function() {
    var text_max = 150;
    $('#char_count').html(text_max + ' characters remaining');

    $('#review').keyup(function() {
        var text_length = $('#review').val().length;
        var text_remaining = text_max - text_length;

        $('#char_count').html(text_remaining + ' characters remaining');
    });
});
