Date.prototype.Format = function (fmt) { //author: zouqj 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};
function showDate(str) {
    if (str == '/Date(-62135596800000)/') return '';
    var d = eval('new ' + str.substr(1, str.length - 2)); //new Date()
    return d.Format("yyyy-MM-dd hh:mm:ss");
}
function showStatus(val) {
    if(val == 1){
        return '<i class="layui-icon green">&#xe618;</i>启用';}
    else{
        return '<i class="layui-icon red" style="font-size:18px;">&#x1006;</i> 停用';
    }
}
function showGender(val) {
    if (val == 1) {
        return '男';
    }
    else {
        return '女';
    }
}
function showDing(val) {
    if (val == 1) {
        return '是';
    }
    else {
        return '否';
    }
}
function showImg(val) {
    return '<img src=' + val+' style="width:100%; height:100%;" />';
}
function ajaxSubmitForm(form, func) {
    var $ = layui.$;
    var action = form.attr("action");
    var _filter = form.serialize();
    $.ajax({
        url:action, //你的路由地址
        type:"post",
        dataType:"json",
        data: _filter,
        timeout:30000,
        success: function (data) {
            if (func) {
                func(data);
            }
    },
    error:function(data){
        console.log(data);
    }
});
}
//去除字符串尾部空格或指定字符  
String.prototype.trimEnd = function (trimStr) {
    if (!trimStr) { return this; }
    var temp = this;
    while (true) {
        if (temp.substr(temp.length - trimStr.length, trimStr.length) != trimStr) {
            break;
        }
        temp = temp.substr(0, temp.length - trimStr.length);
    }
    return temp;
}
function urlToJson(str) {
    var obj = {}, strs = [];
    var ret = "";
    str = decodeURIComponent(str, true);
    //str = encodeURI(encodeURI(str));
    if (str.indexOf("&") != -1) {
        strs = str.split("&");
    } else {
        strs[0] = str;
    }
    for (var i = 0; i < strs.length; i++) {
        if (strs[0].indexOf("=") != -1) {
            var v1 = strs[i].split("=")[1] == "" ? null : "'" + strs[i].split("=")[1] + "'";
            ret += "'" + strs[i].split("=")[0] + "'" + ":" + v1 + ',';
        }
    }
    ret = ret.trimEnd(',')
    ret = "{" + ret + "}";
    obj = ret == '{}' ? {} : eval('(' + ret + ')');
    return obj;
}
function openSetIcon() {
    layer.open({
        title: '选择菜单图标',
        type: 2,
        area: ['100%', '100%'],
        fixed: false, //不固定
        maxmin: true,
        content: '/Icon.html'
    });
}
document.onkeydown = function (event){                //网页内按下回车触发
    if(event.keyCode==13)
    {
        document.getElementById("btnSearch").click();   
        return false;                               
    }
}
faces = function () {
    var i = ["[微笑]", "[嘻嘻]", "[哈哈]", "[可爱]", "[可怜]", "[挖鼻]", "[吃惊]", "[害羞]", "[挤眼]", "[闭嘴]", "[鄙视]", "[爱你]", "[泪]", "[偷笑]", "[亲亲]", "[生病]", "[太开心]", "[白眼]", "[右哼哼]", "[左哼哼]", "[嘘]", "[衰]", "[委屈]", "[吐]", "[哈欠]", "[抱抱]", "[怒]", "[疑问]", "[馋嘴]", "[拜拜]", "[思考]", "[汗]", "[困]", "[睡]", "[钱]", "[失望]", "[酷]", "[色]", "[哼]", "[鼓掌]", "[晕]", "[悲伤]", "[抓狂]", "[黑线]", "[阴险]", "[怒骂]", "[互粉]", "[心]", "[伤心]", "[猪头]", "[熊猫]", "[兔子]", "[ok]", "[耶]", "[good]", "[NO]", "[赞]", "[来]", "[弱]", "[草泥马]", "[神马]", "[囧]", "[浮云]", "[给力]", "[围观]", "[威武]", "[奥特曼]", "[礼物]", "[钟]", "[话筒]", "[蜡烛]", "[蛋糕]"],
        a = {};
    return layui.each(i, function (i, e) {
        a[e] = layui.cache.dir + "images/face/" + i + ".gif"
    }), a
}();

function convert(content) {
    //支持的html标签
    var html = function (end) {
        return new RegExp('\\[' + (end || '') + '(pre|div|table|thead|th|tbody|tr|td|ul|li|ol|li|dl|dt|dd|h2|h3|h4|h5)\\]\\n*', 'g');
    };
    content = content.replace(/img\[([^\s]+?)\]/g, function (img) {  //转义图片
        return '<img src="' + img.replace(/(^img\[)|(\]$)/g, '') + '">';
    }).replace(/@(\S+)(\s+?|$)/g, '@<a href="javascript:;" class="fly-aite">$1</a>$2') //转义@
        .replace(/face\[([^\s\[\]]+?)\]/g, function (face) {  //转义表情
            var alt = face.replace(/^face/g, '');
            return '<img alt="' + alt + '" title="' + alt + '" src="' + faces[alt] + '">';
        }).replace(/a\([\s\S]+?\)\[[\s\S]*?\]/g, function (str) { //转义链接
            var href = (str.match(/a\(([\s\S]+?)\)\[/) || [])[1];
            var text = (str.match(/\)\[([\s\S]*?)\]/) || [])[1];
            if (!href) return str;
            var rel = /^(http(s)*:\/\/)\b(?!(\w+\.)*(sentsin.com|layui.com))\b/.test(href.replace(/\s/g, ''));
            return '<a href="' + href + '" target="_blank"' + (rel ? ' rel="nofollow"' : '') + '>' + (text || href) + '</a>';
        }).replace(html(), '\<$1\>').replace(html('/'), '\</$1\>') //转移代码
        .replace(/\n/g, '<br>') //转义换行
    return content;
}