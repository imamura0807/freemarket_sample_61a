
$(function()  {
  // タブのDOM要素を取得し、変数で定義
  let tabs = $(".menu_item");
  // console.log(tabs)
  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch(e) {
    e.preventDefault();
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $('.active').removeClass("active");
    // console.log(this);
    // debugger

    // クリックしたタブにactiveクラスを追加

    $(this).addClass("active");
    // console.log(this)
    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたタブに対応するshowクラスを追加する
    $(".content").removeClass("show").eq(index).addClass("show");
    // $(".content").eq(index).addClass("show")
  }

  // タブがクリックされたらtabSwitch関数を呼び出す
  tabs.click(tabSwitch);    
});
$(function()  {
  // タブのDOM要素を取得し、変数で定義
  let tabs = $(".tabs");
  // console.log(tabs)
  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch(e) {
    e.preventDefault();
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $('.act').removeClass("act");
    // console.log(this);
    // debugger

    // クリックしたタブにactiveクラスを追加

    $(this).addClass("act");
    // console.log(this)
    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたタブに対応するshowクラスを追加する
    $(".cont").removeClass("sho").eq(index).addClass("sho");
    // $(".content").eq(index).addClass("show")
  }

  // タブがクリックされたらtabSwitch関数を呼び出す
  tabs.click(tabSwitch);    
});

