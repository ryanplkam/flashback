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
    $(".trip-page .edit-trip-btn").css("margin", "5px 15px 15px 0px");
    $(".trip-page .edit-trip-btn").removeClass("pull-right").addClass('pull-left');
  } else {
    $(".trip-page .edit-trip-btn").css("margin", "20px 0px 20px 15px");
    $(".trip-page .edit-trip-btn").addClass("pull-right").removeClass('pull-left');
  }
  
  // Responsive buttons on activity page
  if ($(window).width() < 1200) {
    $('.activity-page .btn-group, .back-button').removeClass('pull-right').addClass('pull-left')
    $('.activity-page .btn-group').css('margin', '0 15px 0 0')
    $('.activity-page .btn-group .btn').css('margin', '0')
    $('.activity-page .back-button').css('margin', '0 0 15px 0') 
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
      $(".trip-page .edit-trip-btn").css("margin", "5px 15px 15px 0px");
      $(".trip-page .edit-trip-btn").removeClass("pull-right").addClass('pull-left');
    } else {
      $(".trip-page .edit-trip-btn").css("margin", "20px 0px 20px 15px");
      $(".trip-page .edit-trip-btn").addClass("pull-right").removeClass('pull-left');
    }

    if ($(window).width() < 1200) {
      $('.activity-page .btn-group, .back-button').removeClass('pull-right').addClass('pull-left')
      $('.activity-page .btn-group').css('margin', '0 15px 0 0')
      $('.activity-page .btn-group .btn').css('margin', '0')
      $('.activity-page .back-button').css('margin', '0 0 15px 0')
    } else {
      $('.activity-page .btn-group, .back-button').removeClass('pull-left').addClass('pull-right').css('margin', '20px 0 0 15px')
    }

  });  

});
