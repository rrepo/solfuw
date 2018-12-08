$(function(){
  function buildPOSING(posting) {
    var posting = $('tbody').append('<tr class="posting" data-id=' + posting.id + '><td>' + posting.text + '</td><td><a href="/posting/' + posting.id + '">Show</a></td><td><a href="/posting/' + posting.id +'/edit">Edit</a></td><td><a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/posting/' + posting.id + '">Destroy</a></td>');
    //'tbody'に'tr'以下のhtml全てをappendする
  }

  $(function(){
    setInterval(update, 10000);
    //10000ミリ秒ごとにupdateという関数を実行する
  });
  function update(){ //この関数では以下のことを行う
    if($('.posting')[0]){ //もし'posting'というクラスがあったら
      var posting_id = $('.posting:last').data('id'); //一番最後にある'posting'というクラスの'id'というデータ属性を取得し、'message_id'という変数に代入
    } else { //ない場合は
      var posting_id = 0 //0を代入
    }
    $.ajax({ //ajax通信で以下のことを行う
      url: location.href, //urlは現在のページを指定
      type: 'GET', //メソッドを指定
      data: { //railsに引き渡すデータは
        message: { id: posting_id } //このような形(paramsの形をしています)で、'id'には'message_id'を入れる
      },
      dataType: 'json' //データはjson形式
    })
    .always(function(data){ //通信したら、成功しようがしまいが受け取ったデータ（@new_message)を引数にとって以下のことを行う
      $.each(data, function(i, data){ //'data'を'data'に代入してeachで回す
        buildPOSING(data); //buildMESSAGEを呼び出す
      });
    });
  }
});