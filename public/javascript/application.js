$(document).ready(function() {

  // Responsive icons on trip page OLD 
  if ($(window).width() < 1200) {
    $(".trip-page .vertical-timeline .glyphicon").css("margin", "8px 0 0 9px");
    $(".trip-page .vertical-timeline .glyphicon-plus").css("margin", "8px 0 0 11px");
  } else {
    $(".trip-page .vertical-timeline .glyphicon").css("margin", "18px 0 0 19px");
    $(".trip-page .vertical-timeline .glyphicon-plus").css("margin", "18px 0 0 21px");
  }
  
  // Responsive justified buttons on trip page
  if ($(window).width() < 768) {
    $('.edit-trip-btns').addClass('btn-group').addClass('btn-group-justified');
  } else {
    $('.edit-trip-btns').removeClass('btn-group').removeClass('btn-group-justified');
  }

  $(window).resize(function() {
    
    // Responsive icons on trip page OLD
    if ($(window).width() < 1200) {
      $(".trip-page .vertical-timeline .glyphicon").css("margin", "8px 0 0 9px");
      $(".trip-page .vertical-timeline .glyphicon-plus").css("margin", "8px 0 0 11px");
    } else {
      $(".trip-page .vertical-timeline .glyphicon").css("margin", "18px 0 0 19px");
      $(".trip-page .vertical-timeline .glyphicon-plus").css("margin", "18px 0 0 21px");
    }

    // Responsive justified buttons on trip page
    if ($(window).width() < 768) {
      $('.edit-trip-btns').addClass('btn-group').addClass('btn-group-justified');
    } else {
      $('.edit-trip-btns').removeClass('btn-group').removeClass('btn-group-justified');
    }

  });  

});
