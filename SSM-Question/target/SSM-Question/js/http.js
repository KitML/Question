/*http请求工具*/
var http = (function () {
    var core = {};
    // post请求
    core.post = function (url, parms, callback,contentType, async) {
        $.ajax({
            url: url, //请求后端的地址
            cache: false,
            async: async == undefined ? true : async,
            data: parms,
            type: "POST",
            // contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            contentType: contentType == undefined ? 'application/x-www-form-urlencoded; charset=UTF-8' : contentType,
            success: function (data) { //成功的回调
                if (data.code == 200 || data.code == 0) {
                    if (typeof callback == "function") {
                        callback(data);
                    }
                }else{
                    layer.msg(data.msg);
                    return;
                }

            },
            //错误的处理
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 403) {
                    layer.msg("您没有权限访问，请联系管理员！")
                } else if (XMLHttpRequest.status == 500) {
                    layer.msg("服务器内部错误！")
                } else {
                    layer.msg("服务器未知错误！")
                }
            }
        });
    };
    //get请求
    core.get = function (url, parms, callback, async) {
        $.ajax({
            url: url,
            cache: false,
            async: async == undefined ? true : async,
            data: parms,
            type: "GET",
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            success: function (data) {
                if (data.code == 200 || data.code == 0) {
                    if (typeof callback == "function") {
                        callback(data);
                    }
                }else{
                    layer.msg(data.msg);
                    return;
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 403) {
                    layer.msg("您没有权限访问，请联系管理员！")
                } else if (XMLHttpRequest.status == 500) {
                    layer.msg("服务器内部错误！")
                } else {
                    layer.msg("服务器未知错误！")
                }
            }
        });
    };
    return core;
})(http, window);