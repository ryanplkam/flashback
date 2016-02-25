$(document).ready(function() {

  $(window).resize(function() {
    
    // Responsive sidebar on trips page
    if ($(window).width() < 992) {
      $(".trips-page .col-md-4").removeClass("fixed-scroll");
    } else {
      $(".trips-page .col-md-4").addClass("fixed-scroll");
    }


    // Responsive icons on trip page
    if ($(window).width() < 1200) {
      $(".trip-page .vertical-timeline .glyphicon").css("margin", "8px 0 0 9px");
    } else {
      $(".trip-page .vertical-timeline .glyphicon").css("margin", "18px 0 0 19px");
    }

    // Move buttons on trip page
    if ($(window).width() < 992) {
      $(".trip-page .edit-trip-btn").css("margin", "0px 15px 20px 0px");
      $(".trip-page .edit-trip-btn").removeClass("pull-right").addClass('pull-left');
    } else {
      $(".trip-page .edit-trip-btn").css("margin", "20px 15px 20px 0px");
      $(".trip-page .edit-trip-btn").addClass("pull-right").removeClass('pull-left');
    }

  });  

});
