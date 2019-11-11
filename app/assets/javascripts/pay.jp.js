
document.addEventListener(
  "DOMContentLoaded", (e) => {
    if (document.getElementById("token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
      Payjp.setPublicKey("pk_test_c78fb942065614c43b114f69"); //ここに公開鍵を直書き
      let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得されます
      btn.addEventListener("click", (e) => { //ボタンが押されたときに作動します
        e.preventDefault(); //ボタンを一旦無効化します
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("code").value,
          exp_month: document.getElementById("expire_month").value,
          exp_year: document.getElementById("expire_year").value
        };
        // トークン作成
        Payjp.createToken(card, (status, response) => {
          if (status === 200) { //成功した場合
            console.log(card)
            $("#card_number").removeAttr("name");
            $("#code").removeAttr("name");
            $("#expire_month").removeAttr("name");
            $("#expire_year").removeAttr("name"); //データを自サーバにpostしないように削除
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); //取得したトークンを送信できる状態にします
            document.inputForm.submit();
            alert("登録が完了しました"); //確認用
          } else {
            alert("カード情報が正しくありません。"); //確認用
          }
        });
      });
    }
  },
  false
);
