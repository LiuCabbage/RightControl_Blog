layui.use(["jquery", "flow"], function () {
    var n = layui.jquery;
    n(".yearToggle").click(function () {
        n('.timeline-month').hide();
        n('.yearToggle').siblings("i").removeClass('fa-caret-down').addClass('fa-caret-right');
        n(this).parent("h2").siblings(".timeline-month").slideToggle("slow");
        //n(this).siblings("i").toggleClass("fa-caret-down fa-caret-right")
        n(this).siblings("i").removeClass('fa-caret-right').addClass('fa-caret-down');
    }
    )
})