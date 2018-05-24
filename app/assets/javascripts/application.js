// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require popper
//= require bootstrap
//= require rails-ujs
//= require tether
//= require turbolinks
//= require Chart.bundle
//= require chartkick

$(function () {
    $('[data-toggle="tooltip"]').tooltip()
});


$(function () {
    $("#flights").on('click', '.pagination .justify-content-center a', function () {
        $.getScript(this.href);
        return false;
    });

    $("#flight_search").submit(function () {
        document.getElementById('tickets_count').value = document.getElementById('f_tickets_count').value;
        $('#loading').show();
        $.ajax({
            type: "GET",
            url: this.action,
            data: $(this).serialize(),
            dataType: "script",
            success: function () {
                $('#submit_ticket').button('reset');
                $('#loading').hide();
                $('#tickets_count').value = $('#f_tickets_count').value;
            }
        });
        return false;
    });
    var searchTimer;
    $("#flight_search input").keyup(function () {
        clearTimeout(searchTimer);
        searchTimer = setTimeout(function () {
            $('#submit_ticket').hide();
            $('#loading').show();
            $.ajax({
                type: "GET",
                url: $("#flight_search").attr("action"),
                data: $("#flight_search").serialize(),
                dataType: "script",
                success: function () {
                    $('#submit_ticket').show();
                    $('#loading').hide();
                    document.getElementById('tickets_count').value = document.getElementById('f_tickets_count').value;
                }
            });
            return false;
        }, 500)
    });
});