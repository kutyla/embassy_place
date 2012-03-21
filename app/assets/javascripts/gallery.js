var effect_time = 1000;
var slideshow = true;
var slideshow_queue = null;
var slideshow_wait = 2000;
var slideshow_current = 0;

$(document).ready(function(){
  $('.thumbnail').click(function(e){
    e.preventDefault();
    clearTimeout(slideshow_queue);
    slideshow = false;
    showSlide($(this));
  })

  function showSlide(object){
    name = object.find("img").attr("src").split("/").pop().split("-")[0];
    $('.gallery-image.active').fadeOut(effect_time);
    $('#gallery-' + name).addClass('active').fadeIn(effect_time);
  }

  function moveSlideshow(){
    if (slideshow == false){ return false; }

    slideshow_current++;
    thumbnail_size = $('#thumbnails .thumbnail').size();
    if ((slideshow_current+1) > thumbnail_size){
      slideshow_current = 0;
    }
    object = $('#thumbnails .thumbnail').eq(slideshow_current);
    showSlide(object);

    slideshow_queue = setTimeout(function(){
      moveSlideshow();
    }, slideshow_wait)
  }

  slideshow_queue = setTimeout(function(){
    moveSlideshow();
  }, slideshow_wait)

})
