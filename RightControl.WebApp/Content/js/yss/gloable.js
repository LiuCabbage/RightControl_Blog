layui.use(['jquery', 'layer', 'util'], function () {
    var $ = layui.jquery,
        layer = layui.layer,
        util = layui.util;
    util.fixbar();
    //导航控制
    master.start($);
    $(".weixin").on("click", function () {
        layer.open({
            type: 1,
            title: false,
            closeBtn: 1,
            area: ['200px','200px'],
            skin: 'layui-layer-nobg', //没有背景色
            shadeClose: true,
            content: $('#weixin')
        });
    });
});
var slider = 0;
var pathname = window.location.pathname.replace('Detail', 'Article');
var master = {};
master.start = function ($) {
    $('#nav li').hover(function () {
        $(this).addClass('current');
    }, function () {
        var href = $(this).find('a').attr("href");
        if (pathname.indexOf(href) == -1) {
            $(this).removeClass('current');
        }
    });
    selectNav();
    function selectNav() {
        var navobjs = $("#nav a");
        $.each(navobjs, function () {
            var href = $(this).attr("href");
            if (pathname.indexOf(href) != -1) {
                $(this).parent().addClass('current');
            }
        });
    };
    $('.phone-menu').on('click', function () {
        $('#nav').toggle(500);
    });
    $(".blog-user img").hover(function () {
        var tips = layer.tips('点击退出', '.blog-user', {
            tips: [3, '#009688'],
        });
    }, function () {
        layer.closeAll('tips');
    })
};
var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
var browserName = "";
//判断是否Safari浏览器
if (userAgent.indexOf("Safari") > 0) {
    browserName = "Safari浏览器";
}
//判断是否Opera浏览器
if (userAgent.indexOf("Opera") > 0) {
    browserName = "Opera浏览器";
};
//判断是否Firefox浏览器
if (userAgent.indexOf("Firefox") > 0) {
    browserName = "Firefox浏览器";
}
//判断是否chorme浏览器
if (userAgent.indexOf("Chrome") > 0) {
    browserName = "Chrome浏览器";
}
//判断是否Edge浏览器
if (userAgent.indexOf("Trident") > 0) {
    browserName = "Edge浏览器";
}
//判断是否浏览器
if (userAgent.indexOf("qqbrowser") > 0) {
    browserName = "QQ浏览器";
}
//判断是否搜狗浏览器
if (userAgent.indexOf("se 2.x") > 0) {
    browserName = "搜狗浏览器";
}