$(document).ready(function() {

  if ($(window).width() < 1170) {
    $(".trips-page .col-lg-4").removeClass("fixed-scroll");
  } else {
    $(".trips-page .col-lg-4").addClass("fixed-scroll");
  }

  // Responsive icons on trip page
  if ($(window).width() < 1200) {
    $(".trip-page .vertical-timeline .glyphicon").css("margin", "8px 0 0 9px");
    $(".trip-page .vertical-timeline .glyphicon-plus").css("margin", "8px 0 0 11px");
  } else {
    $(".trip-page .vertical-timeline .glyphicon").css("margin", "18px 0 0 19px");
    $(".trip-page .vertical-timeline .glyphicon-plus").css("margin", "18px 0 0 21px");
  }

  // Move buttons on trip page
  if ($(window).width() < 992) {
    $(".trip-page .edit-trip-btn").css("margin", "0px 15px 20px 0px");
    $(".trip-page .edit-trip-btn").removeClass("pull-right").addClass('pull-left');
  } else {
    $(".trip-page .edit-trip-btn").css("margin", "20px 0px 20px 15px");
    $(".trip-page .edit-trip-btn").addClass("pull-right").removeClass('pull-left');
  }
  
   // Responsive button margins on activity page
  if ($(window).width() < 992) {
    $(".activity-details .btn").css("margin", '0 15px 15px 0').removeClass('pull-right').addClass('pull-left');
  } else {
    $(".activity-details .btn").css("margin", '20px 0 20px 15px').removeClass('pull-left').addClass('pull-right');
  }

  $(window).resize(function() {
    
    // Responsive sidebar on trips page
    if ($(window).width() < 1200) {
      $(".trips-page .col-lg-4").removeClass("fixed-scroll");
    } else {
      $(".trips-page .col-lg-4").addClass("fixed-scroll");
    }

    // Responsive icons on trip page
    if ($(window).width() < 1200) {
      $(".trip-page .vertical-timeline .glyphicon").css("margin", "8px 0 0 9px");
      $(".trip-page .vertical-timeline .glyphicon-plus").css("margin", "8px 0 0 11px");
    } else {
      $(".trip-page .vertical-timeline .glyphicon").css("margin", "18px 0 0 19px");
      $(".trip-page .vertical-timeline .glyphicon-plus").css("margin", "18px 0 0 21px");
    }

    // Move buttons on trip page
    if ($(window).width() < 992) {
      $(".trip-page .edit-trip-btn").css("margin", "0px 15px 20px 0px");
      $(".trip-page .edit-trip-btn").removeClass("pull-right").addClass('pull-left');
    } else {
      $(".trip-page .edit-trip-btn").css("margin", "20px 0px 20px 15px");
      $(".trip-page .edit-trip-btn").addClass("pull-right").removeClass('pull-left');
    }

     // Responsive button margins on activity page
    if ($(window).width() < 1200) {
      $(".activity-details .btn").css("margin", '0 15px 15px 0').removeClass('pull-right').addClass('pull-left');
    } else {
      $(".activity-details .btn").css("margin", '20px 0 20px 15px').removeClass('pull-left').addClass('pull-right');
    }

  });  

});
