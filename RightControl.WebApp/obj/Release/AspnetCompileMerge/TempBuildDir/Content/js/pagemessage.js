layui.use(['element', 'jquery', 'form', 'layedit', 'flow'], function () {
    var element = layui.element;
    var form = layui.form;
    var $ = layui.jquery;
    var layedit = layui.layedit;
    var flow = layui.flow;
    flow.load({
        elem: "#message-list",
        done: function (page, next) {
            var pagecount = $(".message-list").attr("data-pagecount"),
                pagesize = $(".message-list").attr("data-pagesize"),
                lis = [];
            $.ajax({
                type: "POST",
                url: "/Feedback/LoadFeedback",
                data: {
                    page: page,
                    pagesize: pagesize
                },
                success: function (res) {
                    //直接后台拼接返回每页的html，舒服啊。
                    lis.push(res);
                    next(lis.join(""), page < pagecount);
                }
            })
        }
    })
    //留言的编辑器
    var editIndex = layedit.build('remarkEditor', {
        height: 150,
        tool: ['face', '|', 'link'],
    });
    //留言的编辑器的验证
    form.verify({
        content: function (value) {
            value = $.trim(layedit.getContent(editIndex));
            if (value == "") return "请输入内容";
            layedit.sync(editIndex);
        },
        replyContent: function (value) {
            if (value == "") return "请输入内容";
        }
    });
    //监听提交
    form.on('submit(formLeaveMessage)', function (obj) {
        var openid = $.cookie('openid');
        if (openid != undefined && "" != openid) {
            var index = layer.load(1);
            $.ajax({
                type: "post",
                url: "/Feedback/AddFeedback",
                data: {
                    openid: openid,
                    editorContent: filterXSS(obj.field.editorContent),
                    fromcity: returnCitySN['cname'],
                    browserName: browserName
                },
                dataType: "json",
                success: function (data) {
                    layer.close(index); //关闭弹框
                    if (data.state == "success") {
                        layer.msg(data.message, {
                            icon: 6
                        });
                    } else {
                        layer.msg(data.message, {
                            icon: 5
                        });
                    }
                    setTimeout(function () {
                        location.reload(!0)
                    }, 1000);
                },
                error: function () {
                    layer.close(index);
                    layer.msg("请求异常", {
                        icon: 2
                    });
                }
            });
        } else {
            layer.msg("请先登录", {
                icon: 5
            });
        }
        return false;
    });
    form.on('submit(formReply)', function (obj) {
        var openid = $.cookie('openid');
        if (openid != undefined && "" != openid) {
            var index = layer.load(1);
            $.ajax({
                type: "post",
                url: "/Feedback/ReplyFeedback",
                data: {
                    openid: openid,
                    remarkId: obj.field.remarkId,
                    targetUserId: obj.field.targetUserId,
                    editorContent: filterXSS(obj.field.replyContent),
                    fromcity: returnCitySN['cname'],
                    browserName: browserName
                },
                dataType: "json",
                success: function (data) {
                    layer.close(index); //关闭弹框
                    if (data.state == "success") {
                        layer.msg(data.message, {
                            icon: 6
                        });
                    } else {
                        layer.msg(data.message, {
                            icon: 5
                        });
                    }
                    setTimeout(function () {
                        location.reload(!0)
                    }, 1000);
                },
                error: function () {
                    layer.close(index);
                    layer.msg("请求异常", {
                        icon: 2
                    });
                }
            });
        } else {
            layer.msg("请先登录", {
                icon: 5
            });
        }
        return false;
    });
    //回复按钮点击事件
    $('#message-list').on('click', '.btn-reply', function () {
        var targetId = $(this).data('targetid')
            , targetName = $(this).data('targetname')
            , $container = $(this).parent('p').parent().siblings('.replycontainer');
        if ($(this).text() == '回复') {
            $container.find('textarea').attr('placeholder', '回复【' + targetName + '】');
            $container.removeClass('layui-hide');
            $container.find('input[name="targetUserId"]').val(targetId);
            $(this).parents('.message-list li').find('.btn-reply').text('回复');
            $(this).text('收起');
        } else {
            $container.addClass('layui-hide');
            $container.find('input[name="targetUserId"]').val(0);
            $(this).text('回复');
        }
    });
});