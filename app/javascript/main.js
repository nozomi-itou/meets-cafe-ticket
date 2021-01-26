//アコーディオンメニュー
jQuery(function ($) {
  $(".accordion-content").css("display", "none");
  
  $(".js-accordion-title").click(function () {
    $(".js-accordion-title").not(this).removeClass("open");
    $(".js-accordion-title").not(this).next().slideUp(300);
    $(this).toggleClass("open");
    $(this).next().slideToggle(300);
  });
});


//サービス内容フェードイン
let fadeService = function(){
  $(window).scroll(function (){
    $('.effect-fade').each(function(){
        var elemPos = $(this).offset().top;
        var scroll = $(window).scrollTop();
        var windowHeight = $(window).height();
        if (scroll > elemPos - windowHeight){
          $(this).addClass('effect-scroll');
        }
    });
  });
};

//ストアギャラリーフェードイン
let fadeStores = function(){
  $('.store').css("opacity","0");  
    $(window).scroll(function (){
    $('.store').each(function(){
      var elemPos = $(this).offset().top;
      var scroll = $(window).scrollTop();      
      var windowHeight = $(window).height();       
          
  if (scroll > elemPos - windowHeight + windowHeight/4){
    $(function(){
    $('.store')
        .each(function(i){
        $(this).delay(500*i).animate({opacity:1}, 1500);
        });
      }); 
      }
    });
  });
};


$(document).ready(function() {
  let windowWidth = $(window).width();
  if (windowWidth <= 375){
  }
  else{
    fadeService(); 
    fadeStores();
  };
});


$(function() {
  var $win = $(window),
      $main = $('main'),
      $nav = $('#nav'),
      navHeight = $nav.outerHeight(),
      navPos = $nav.offset().top,
      fixedClass = 'is-fixed';

  $win.on('load scroll', function() {
    var value = $(this).scrollTop();
    //console.log("v", value, "p", navPos,  "h", navHeight, value > navPos)
    if ( value > navPos ) {
      $nav.addClass(fixedClass);
      //$main.css('margin-top', navHeight);
    } else {
      $nav.removeClass(fixedClass);
      $main.css('margin-top', '0');
    }
  });
});



$(window).on('load scroll', function (){

  var box = $('.fadeIn');
  var animated = 'animated';
  
  box.each(function(){
  
    var boxOffset = $(this).offset().top;
    var scrollPos = $(window).scrollTop();
    var wh = $(window).height();

    if(scrollPos > boxOffset - wh + 100 ){
      $(this).addClass(animated);
    }
  });

});


//ハンバーガーメニューを表示・非表示
$('.btn_trigger').on('click',function(){
  $('.btn_trigger').toggleClass('close');//クラス名に close クラスを追加もしくは消す
  $('.nav-wrapper').fadeToggle(300);//メニューのフェードイン/フェードアウト // diaplay: none と display: visibleの切替
  $('body').toggleClass('noscroll');//スクロールを固定
});

//aタグからリンクで飛ぶと、ハンバーガーを消す
if ($(window).width() <= 375) {//デバイスの幅が768以下のとき
$('.nav-item>a').on('click',function(){
  $('.nav-wrapper').fadeOut(300);
  $('.btn_trigger').removeClass('close');//.btn_triggerのcloseクラスを削除
    $('body').removeClass('noscroll');//bodyのnoscrollクラスを削除
});
}


// アニメーション
$(window).on('load',function(){
  var style = '<link rel="stylesheet" href="./CSS/animate.css">';
  $('head link:last').after(style);
});

