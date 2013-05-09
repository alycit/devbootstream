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

var tempX = 0;
var tempY = 0;

$(document).ready(function() {

  var $container = $('#container');
  $container.imagesLoaded(function(){
    $container.masonry({
      itemSelector : '.grid'
    });

  $(document).mousemove(function (e) {
        var bodyOffsets = document.body.getBoundingClientRect();
        tempX = e.pageX - bodyOffsets.left;
        tempY = e.pageY;
  });

  $('#source').click(function(event) {
    $('#sources').css({'left': tempX -100, 'top': tempY -20 }).show(); 
  }), $("#sources").hover(function() {
    }, function(){
    $("#sources").hide();
  });

  $('#phase').click(function(event) {
    $('#phases').css({'left': tempX -100, 'top': tempY -20 }).show(); 
  }), $("#phases").hover(function() {
    }, function(){
    $("#phases").hide();
  });

  $('#cohort').click(function(event) {
    $('#cohorts').css({'left': tempX -100, 'top': tempY -20 }).show(); 
  }), $("#cohorts").hover(function() {
    }, function(){
    $("#cohorts").hide();
  });

    $('#container').infinitescroll({
     
      navSelector  : "#pagination",            
                     // selector for the paged navigation (it will be hidden)
     
      nextSelector : "#pagination a:first",    
                     // selector for the NEXT link (to page 2)
     
      itemSelector : "#container .grid",          
                     // selector for all items you'll retrieve
     
      debug        : true,                        
                     // enable debug messaging ( to console.log )
     
      // loadingImg   : "/img/loading.gif",          
                     // loading image.
                     // default: "http://www.infinite-scroll.com/loading.gif"
     
      loadingText  : "Loading new posts...",      
                     // text accompanying loading image
                     // default: "<em>Loading the next set of posts...</em>"
     
      animate      : true,      
                     // boolean, if the page will do an animated scroll when new content loads
                     // default: false
     
      extraScrollPx: 50,      
                     // number of additonal pixels that the page will scroll 
                     // (in addition to the height of the loading div)
                     // animate must be true for this to matter
                     // default: 150
     
      donetext     : "I think we've hit the end, Jim" ,
                     // text displayed when all items have been retrieved
                     // default: "<em>Congratulations, you've reached the end of the internet.</em>"
     
      bufferPx     : 40,
                     // increase this number if you want infscroll to fire quicker
                     // (a high number means a user will not see the loading message)
                     // new in 1.2
                     // default: 40
     
      errorCallback: function(){console.log("errror")},
                     // called when a requested page 404's or when there is no more content
                     // new in 1.2                   
     
      localMode    : true
                     // enable an overflow:auto box to have the same functionality
                     // demo: http://paulirish.com/demo/infscr
                     // instead of watching the entire window scrolling the element this plugin
                     //   was called on will be watched
                     // new in 1.2
                     // default: false
     
        },function(newElements){
           var $newElems = $( newElements ).css({ opacity: 0 });
          // ensure that images load before adding to masonry layout
          $newElems.imagesLoaded(function(){
            // show elems now they're ready
        
            $newElems.animate({ opacity: 1 });
            $("#container").masonry( 'appended', $newElems, true ); 
          });
     
     });


  });

  // usage:
// $(elem).infinitescroll(options,[callback]);
 
// infinitescroll() is called on the element that surrounds 
// the items you will be loading more of


    
});











