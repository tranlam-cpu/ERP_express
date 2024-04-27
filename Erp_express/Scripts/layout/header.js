
    //$(document).ready(function () {
    //    $(window).scroll(function () {
    //        if ($(this).scrollTop() > 100) {
    //            $('.navbar').addClass('navbar-active');
    //        } else {
    //            $('.navbar').removeClass('navbar-active');
    //        }
    //    });
    //});
    




$(document).ready(function () {
    var controller = new ScrollMagic.Controller();

    var tween = gsap.fromTo(".logo",
        { y: "-300px", scale: 7 },
        { y: "0", scale: 1, ease: "none", duration: 1 });

    tween.eventCallback("onUpdate", function () {
      
        if (Math.round(gsap.getProperty(".logo", "y")) > -11 ) {
            $('.navbar').addClass('navbar-active');
            $('.nav-logo').addClass('visible');
            $('.logo').css('display', 'none');
            $('.nav-title').css('color', '#f74c25')

            $('.btn-nav').removeClass('btn-title');
            $('.btn-nav').addClass('btn-title-active');
          
        } else {
            $('.navbar').removeClass('navbar-active');
            $('.nav-logo').removeClass('visible');
            $('.logo').css('display', 'block');
            $('.nav-title').css('color', 'white')

            $('.btn-nav').removeClass('btn-title-active');
            $('.btn-nav').addClass('btn-title');
        }
    });

    var scene = new ScrollMagic.Scene({
        triggerElement: ".navbar-container",
        duration: $(".navbar-container").height()+200,
    })
        .setTween(tween)
        .addTo(controller);
});
