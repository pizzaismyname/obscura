$(document).ready(function() {
    $(".theme-details").click(function() {
        var name = $(this).data("name");
        var description = $(this).data("description");
        var price = $(this).data("price");
        var picture = "/" + $(this).data("picture");
        $("#details-name").html(name);
        $("#details-description").html(description);
        $("#details-price").html(price);
        $("#details-picture").attr('src', picture);
    });
    $(".booking-details").click(function() {
        var id = $(this).data("id");
        var name = $(this).data("name");
        var phone = $(this).data("phone");
        var email = $(this).data("email");
        var address = $(this).data("address");
        var date = $(this).data("date");
        var start = $(this).data("start");
        var end = $(this).data("end");
        var theme = $(this).data("theme");
        var price = $(this).data("price");
        var status = $(this).data("status");
        var admin = $(this).data("admin");
        $("#details-id").html(id);
        $("#details-name").html(name);
        $("#details-phone").html(phone);
        $("#details-email").html(email);
        $("#details-address").html(address);
        $("#details-date").html(date);
        $("#details-start").html(start);
        $("#details-end").html(end);
        $("#details-theme").html(theme);
        $("#details-price").html(price);
        $("#details-status").html(status);
        $("#details-admin").html(admin);
    });
});