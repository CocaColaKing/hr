/**
 * User:jyw915@live.com
 * Date:2017/9/25
 * Time:18:40
 * Create by IntelliJ IDEA
 */

//加载aside样式
function loadAside() {
    // $("#nav").load("common/aside",function(){
        var nav_menus = $("#nav_list>li");

        // console.log(arguments[0]);
        // console.log(arguments[1]);
        // console.log(nav_menus.length);

        nav_menus.eq(arguments[0]).addClass("active");
        nav_menus.eq(arguments[0]).find("a").eq(0).addClass("active");
        // if(arguments[0]===0||arguments[0]===2){
            $(".fa-angle-down").eq(arguments[0]).removeClass("text-active").addClass("text");
            $(".fa-angle-up").eq(arguments[0]).removeClass("text").addClass("text-active");
        // }

        nav_menus.eq(arguments[0]).find("ul").eq(0).css("display","block");

        $("#nav_list>li").eq(arguments[0]).find("li").eq(arguments[1]).addClass("active");

        $("#nav>section").css("height",$("#nav").css("height"));
    // });

    // $("header").eq(0).load("common/header",function(){
    //
    // });
}

// function removeContent() {
//     $("#"+arguments[0]).empty();
// }

function randomString(len) {
    len = len || 32;
    // var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
    var $chars = '0123456789';
    var maxPos = $chars.length;
    var pwd = '';
    for (i = 0; i < len; i++) {
        pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
    }
    return pwd;
}

function backRefresh(obj) {
    console.log($(obj).val());
    if($(obj).val()==='no'){
        $(obj).val('yes');
    }else {
        $(obj).val('no');
        location.reload();
    }
    console.log($(obj).val());
}

function getParam(key) {
    var reg = new RegExp("(^|&)"+ key +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}

function loading() {
    $('input').blur();
    $("textarea").blur();
    $("body").append('<div class="loader-bg">' +
        '    <div class="weui-loadmore">' +
        '        <i class="weui-loading"></i>' +
        '    </div>' +
        '</div>');
}
function loadingEnd() {
    $(".loader-bg").remove();
}


