$(document).on('turbolinks:load', function(){
  $(function() {
    // -----------------子カテゴリーを追加するための処理---------------------------
    function buildChildHTML(child){
      var html =`<li><a class="child_category" id="${child.id}" 
                  href="/category/${child.id}">${child.name}</a></li>`;
      return html;
    }
  
    $(".parent_category").on("mouseover", function() {
      var id = this.id//どのリンクにマウスが乗ってるのか取得
      $(".now-selected-red").removeClass("now-selected-red")//赤色のcss
      $('#' + id).addClass("now-selected-red");//赤色のcss
      $(".child_category").remove();//子カテゴリ消す
      $(".grand_child_category").remove();
      $.ajax({
        type: 'GET',
        url: '/category/new',
        data: {parent_id: id},
        dataType: 'json'
      }).done(function(children) {
        children.forEach(function (child) {
          var html = buildChildHTML(child);
          $(".children_list").append(html);
        })
      });
    });
  
    // -----------------------------孫カテゴリを追加する処理------------------------------
    function buildGrandChildHTML(child){
      var html =`<li><a class="grand_child_category" id="${child.id}"
                href="/category/${child.id}">${child.name}</a></li>`;
      return html;
    }
  
    $(document).on("mouseover", ".child_category", function () {
      var id = this.id
      $(".now-selected-gray").removeClass("now-selected-gray");//灰色のcss
      $('#' + id).addClass("now-selected-gray");//灰色のcss
      $.ajax({
        type: 'GET',
        url: '/category/new',
        data: {parent_id: id},
        dataType: 'json'
      }).done(function(children) {
        children.forEach(function (child) {
          var html = buildGrandChildHTML(child);
          $(".grand_children_list").append(html);
        })
        $(document).on("mouseover", ".child_category", function () {
          $(".grand_child_category").remove();
        });
      });
    });  
  });
  //--------------humberger-list の表示、非表示 --------------------
  $(function(){
    $('.humberger').mouseover(function(){
      $('.humberger__list').css('display','flex');
    })
  });
  $(function(){
    $('.contents').mouseover(function(){
      $('.humberger__list').css('display','none')
    })
  });
});