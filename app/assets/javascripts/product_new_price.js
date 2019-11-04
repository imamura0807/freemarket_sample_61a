$( function() {
  $("#product_price").on("keyup", function(e) {
    e.preventDefault();
    var input = $(this).val();
    if (input >= 300 && 9999999 >= input ) {
      var fee = Math.floor(input / 10);
      var profit = (input - fee);
      $('.container-3__main__price__box2__top2__right').text('¥' + fee.toLocaleString());
      $('.container-3__main__price__box2__top3__right').text('¥' + profit.toLocaleString());
    } else {
      $('.container-3__main__price__box2__top2__right').text('-');
      $('.container-3__main__price__box2__top3__right').text('-');
    }
  })
})