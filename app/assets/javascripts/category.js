$(document).on('turbolinks:load', function() {
  $(function(){
//=============================================================================================================================
  //カテゴリーのオプション要素のHTML
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
//=====================================================================================================================
  //カテゴリーの子要素のセレクトボックス
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div id="children_wrapper">
                          <div class="select__box">
                            <i class="fa fa-angle-down"></i>
                            <select class="select-default" id="child_category" name="product[category_id]">
                              <option value="---">---</option>
                              ${insertHTML}
                            </select>
                          </div>
                         </div>`;
      $('.listing-product-detail__category').append(childSelectHtml);
    }
//=====================================================================================================================
  //カテゴリーの孫要素のセレクトボックス
    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div id="grandchildren_wrapper">
                                <div class="select__box">
                                  <i class="fa fa-angle-down"></i>
                                  <select class="select-default" id="grandchild_category" name="product[category_id]">
                                    <option value="---">---</option>
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>`;
      $('.listing-product-detail__category').append(grandchildSelectHtml);
    }

// ***************************************************************************************
  //サイズのオプション要素のHTML
    function appendSizeOption(size_type){
      var html = `<option value="${size_type.id}">${size_type.size_type}</option>`;
      return html;
    }
//=====================================================================================================================
  //サイズとブランドの要素のセレクトボックス
    function appendSizeBox(insertHTML){
      var sizeSelectHtml = '';
      sizeSelectHtml = `<div class="form__group" id="size_wrapper">
                          <label>サイズ
                            <span class="necessary">必須</span>
                          </label>
                          <div class="select__box">
                            <i class="fa fa-angle-down"></i>
                            <select class="select-default" name="product[size_type_id]">
                              <option value="">---</option>
                              ${insertHTML}
                            </select>
                          </div>
                        </div>

                        <div class="form__group" id="brand_wrapper">
                          <label>ブランド
                            <span class="form-arbitrary">任意</span>
                          </label>
                          <div>
                            <input class="c-input-default" value="" placeholder="例）シャネル" type="text" name="product[brand]">
                          </div>
                        </div>`;
      $('.listing-product-detail__category').append(sizeSelectHtml);
    }
//=========================================================================================================================
//=====================================================================================================================
  //カテゴリーの子要素発火
    $('#parent_category').on('change', function(){
      var parentCategory = document.getElementById('parent_category').value; 
      if (parentCategory != "---"){ 
        $.ajax({
          url: '/products/get_category_children',
          type: 'GET',
          data: { parent_name: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
      }
    });
//================================================================================================================
//=====================================================================================================================
  //カテゴリーの孫要素発火
    $('.listing-product-detail__category').on('change', '#child_category', function(){
      var childId = $('#child_category option:selected').data('category'); 
      if (childId != "---"){ 
        $.ajax({
          url: '/products/get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove(); 
            $('#size_wrapper').remove();
            $('#brand_wrapper').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove(); 
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
      }
    });
//===========================================================================================================================================
//=====================================================================================================================
  //サイズとブランドの要素発火
    $('.listing-product-detail__category').on('change', '#grandchild_category', function(){
      var grandchildId = $('#grandchild_category option:selected').data('category'); 
      if (grandchildId != "---"){ 
        $.ajax({
          url: '/products/get_size_type',
          type: 'GET',
          data: { grandchild_id: grandchildId },
          dataType: 'json'
        })
        .done(function(size_types){
          $('#size_wrapper').remove(); 
          $('#brand_wrapper').remove();
          if (size_types.length != 0) {
          var insertHTML = '';
            size_types.forEach(function(size_type){
              insertHTML += appendSizeOption(size_type);
            });
            appendSizeBox(insertHTML);
          } else {
            appendBrandBox(); 
          }
        })
        .fail(function(){
          alert('サイズ取得に失敗しました');
        })
      }else{
        $('#size_wrapper').remove(); 
        $('#brand_wrapper').remove();
      }
    });
  });
});