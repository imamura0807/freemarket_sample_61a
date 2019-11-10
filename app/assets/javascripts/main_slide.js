$(function() {
  $('.slider_main_top').slick({
      prevArrow:'<i class="slider_left"></i>',
      nextArrow:'<i class="slider_right"></i>',
      autoplay: true,
      autoplaySpeed: 2500,
      speed: 800
  });
  $('.slider_main_top').on(function() {
    $('.slider_main_top').slick('goTo', $(this).index());
  });
});