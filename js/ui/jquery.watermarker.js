(function (b) {
    b.Watermarker = function (c, i) {
        function l() {
            d.width(e.width()); d.height(e.height()); var a = g(f.css("borderLeftWidth")), o = g(f.css("borderRightWidth")), b = g(f.css("borderTopWidth")), c = g(f.css("borderBottomWidth")); f.width(e.width() - a - o); f.height(e.height() - b - c)
        } function g(a) {
            return parseInt(a.replace("px", ""))
        } function j() {
            var k = m(d), b = m(n); a.onChange({ x: k[0] - b[0], y: k[1] - b[1], w: d.width(), h: d.height(), opacity: a.opacity })
        } function m(a) {
            a = b(a).offset(); return [a.left, a.top]
        } "object" !== typeof c &&
(c = b(c)[0]); "object" !== typeof i && (i = {});
var a = { watermark_img: "watermark.png", opacity: 1, opacitySlider: null, x: null, y: null, w: null, h: null, position: null, onChange: function () { }, onSelect: function () { } }; (function (k) { "object" != typeof k && (k = {}); a = b.extend(a, k); "function" !== typeof a.onChange && (a.onChange = function () { }); "function" !== typeof a.onSelect && (a.onSelect = function () { }) })(i);

var h = b(c);
var newh = h.height();
if (newh > 600) newh = 600;
var neww = h.width();
if (neww > 1024) neww = 1024;
var n = b("<div />").width(neww).height(newh).css({ position: "relative" }).insertAfter(h);
n.append(h);
var e = b("<div />").resizable({
            resize: function () {
                l();
                j()
            },
            containment: "parent"
        }).draggable({ drag: function () { j() }, containment: "parent" }).css({ position: "absolute" }).insertAfter(h), f = b("<div />").addClass("watermark").css({ position: "absolute", "z-index": 1 }); e.append(f);
        var d = b("<img />").attr("src", a.watermark_img).addClass("watermark").css({ position: "absolute", "z-index": 2 }).load(function () {
            var b = Math.round(h.width() / 2 - d.width() / 2), c = Math.round(h.height() / 2 - d.height() / 2), f = h.height() - d.height(), g = h.width() - d.width(); if (null != a.x && null != a.y) b = a.x, c = a.y;
            else if (null != a.position) switch (a.position) { case "topleft": c = b = 0; break; case "topcenter": c = 0; break; case "topright": b = g; c = 0; break; case "centerleft": b = 0; break; case "centerright": b = g; break; case "bottomleft": b = 0; c = f; break; case "bottomcenter": c = f; break; case "bottomright": b = g, c = f } e.css({ top: c + "px", left: b + "px" }); e.width(null == a.w ? d.width() : a.w); e.height(null == a.h ? d.height() : a.h); l(); e.css({ opacity: a.opacity, filter: "alpha(opacity=" + 100 * a.opacity + ")" }); j()
        });
        e.append(d); null !== a.opacitySlider && a.opacitySlider.slider({
            min: 0,
max:100,value:100*a.opacity,slide:function(b,c){a.opacity=c.value/100;e.css({opacity:a.opacity,filter:"alpha(opacity="+100*a.opacity+")"});j()}})};b.fn.Watermarker=function(c){function i(i){var g=c.useImg||i.src,j=new Image;j.onload=function(){b.Watermarker(i,c)};j.src=g}"object"!==typeof c&&(c={});this.each(function(){if(b(this).data("Watermarker")){if("api"==c)return b(this).data("Watermarker");b(this).data("Watermarker").setOptions(c)}else i(this)});return this}})(jQuery);
