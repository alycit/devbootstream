// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  //vendor script
  $('#header')
  .css({ 'top':-50 })
  .delay(1000)
  .animate({'top': 0}, 800);
  
  $('#footer')
  .css({ 'bottom':-15 })
  .delay(1000)
  .animate({'bottom': 0}, 800);
  
  //blocksit define
  $(window).load( function() {
    $('#container').BlocksIt({
      numOfCol: 5,
      offsetX: 8,
      offsetY: 8
    });
  });
  
  //window resize
  var currentWidth = 1100;
  $(window).resize(function() {
    var winWidth = $(window).width();
    var conWidth;
    if(winWidth < 660) {
      conWidth = 440;
      col = 2
    } else if(winWidth < 880) {
      conWidth = 660;
      col = 3
    } else if(winWidth < 1100) {
      conWidth = 880;
      col = 4;
    } else {
      conWidth = 1100;
      col = 5;
    }
    
    if(conWidth != currentWidth) {
      currentWidth = conWidth;
      $('#container').width(conWidth);
      $('#container').BlocksIt({
        numOfCol: col,
        offsetX: 8,
        offsetY: 8
      });
    }
  });
});