$(document).ready(function() {

  $(window).resize(function() {
    if ($(window).width() < 992) {
      $(".trips-page .col-md-4").removeClass("fixed-scroll");
    } else {
      $(".trips-page .col-md-4").addClass("fixed-scroll");
    }
  });  

});
