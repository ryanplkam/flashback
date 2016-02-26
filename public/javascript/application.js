$(document).ready(function() {

  // // Set height of photos div on inidivual activity page
  // var raw_height = $(window).height();
  // var height = raw_height - 51;
  // $('.activity-photos').height(height);

  $(window).resize(function() {
    
    // Responsive sidebar on trips page
    if ($(window).width() < 1170) {
      $(".trips-page .col-lg-4").removeClass("fixed-scroll");
    } else {
      $(".trips-page .col-lg-4").addClass("fixed-scroll");
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
  

     // Responsive button margins on activity page
    if ($(window).width() < 992) {
      $(".activity-details .btn-primary").css("margin-top", '0').css('margin-bottom', '15px');
    } else {
      $(".activity-details .btn-primary").css("margin-top", '20px').css('margin-bottom', '0');
    }


  });  

});
