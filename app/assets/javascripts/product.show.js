$(function() {

  $(function() {
    $('img.sub_image').mouseover(function(){
      var ImgSrc = $(this).attr("src");
      $("img#main").attr({src:ImgSrc});
      $(this).css('opacity', '1');
    });
  });
  $(function() {
    $('img.sub_image').mouseout(function(){
      $(this).css('opacity', '0.5');
    });
  });
})