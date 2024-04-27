$(document).ready(function () {
    var controller = new ScrollMagic.Controller();

    $('.img-sub1-blod, .img-sub2-blod, .img-sub3-blod, .community-title').each(function () {
        var tween = gsap.from(this, { autoAlpha: 0, y: 50, ease: "none", duration: 1 });

        var scene = new ScrollMagic.Scene({
            triggerElement: this,
            triggerHook: 0.9, // starts the animation when the element is 90% visible
        })
            .setTween(tween)
            .addTo(controller);
    });

   
});