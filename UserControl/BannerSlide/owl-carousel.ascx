<%@ control language="C#" autoeventwireup="true" inherits="UserControl_BannerSlide_owl_carousel, App_Web_5shlwl0b" %>
<div class="mainpage">
    <div class="owl-carousel owl-theme">
        <div  class="item">
            <img  src="/images/slider/cpu5.jpg" alt="" />
        </div>
        <div class="item">
            <img  src="/images/slider/maytinh.jpg" alt="" />
        </div>
        <div class="item">
            <img  src="/images/slider/tainghe.jpg" alt="" />
        </div>
        <div class="item">
            <img src="/images/slider/banphim2.jpg" alt="" />
        </div>
    </div>
</div>
<script>
    $(function () {
        $('.owl-carousel').owlCarousel({
            autoPlay: true,
            //paginationNumbers: true,
            navigation: true,
            navigationText: [
               '<i class="fa fa-angle-left"></i>',
               '<i class="fa fa-angle-right"></i>'
            ],
            singleItem: true,
            transitionStyle: "fade"
        });
    });
</script>
