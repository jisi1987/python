<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>品尚易贷</title>
<%@ include file="/WEB-INF/jsp/global/global_http.jsp"%>
<link href="${crul }css/addFinancing.css?v=${cssVersion}" type="text/css" rel="stylesheet" />
<!--<script src="${srul }js/app/jquery.html5uploader.js"></script>-->
    <link href="${srul }js/layui/css/layui.css" type="text/css">
    <script src="${srul }js/layui/layui.js"></script>
    
<script src="${srul }js/addFinancing.js?v=${jsVersion}" type="text/javascript"></script>
<style>
    .layui-upload-file{display: none !important;}
</style>
</head>
<body>
		<%@ include file="/WEB-INF/jsp/global/head.jsp" %>
        <input type="hidden" value="${applyid}" id="applyId">
		<div id="content" class="u-content">
			<div class="w980">
				<form method="post" id="myform" name="myform" action="${ctx }saveFinancing"> <!---->
					<s:token />
					<div class="w980 mb25" style="height:auto; overflow:hidden">
                        <div class="borrow-box" id="step2">
							<div class="borrow-tit">
								<span>我要融资</span>
								<img src="../images/borrow02.png">
							</div>
							<div class="borrow-info" style="width:1000px;">
                                <table class="uploadFileTable" style="margin-left:40px;">
                                    <thead>
                                        <tr>
                                            <th style="width:250px;">材料名称</th>
                                            <th style="width:80px;">状态</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1.公司简介</td>
                                            <td><span class="type">未上传</span></td>
                                            <td>
                                                <a class="a_upload" id="gsjj">上传材料</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2.营业执照</td>
                                            <td><span class="type">未上传</span></td>
                                            <td>
                                                <a class="a_upload" id="yyzz">上传材料</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3.开户许可证</td>
                                            <td><span class="type">未上传</span></td>
                                            <td>
                                                <a class="a_upload" id="khxkz">上传材料</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4.公司章程</td>
                                            <td><span class="type">未上传</span></td>
                                            <td>
                                                <a class="a_upload" id="gszc">上传材料</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>5.法人身份证</td>
                                            <td><span class="type">未上传</span></td>
                                            <td>
                                                <a class="a_upload" id="frsfz">上传材料</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>6.近两年审计报告及近期财务报表(打包)</td>
                                            <td><span class="type">未上传</span></td>
                                            <td>
                                                <a class="a_upload" id="cwbb">上传材料</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>7.当季采购订单</td>
                                            <td><span class="type">未上传</span></td>
                                            <td>
                                                <a class="a_upload" id="cgdd">上传材料</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>8.其他</td>
                                            <td><span class="type">未上传</span></td>
                                            <td>
                                                <a class="a_upload" id="qt">上传材料</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <p style="color:#f00;line-height:40px;padding-left:66px;">注：只能上传图片及PDF格式文件</p>
                                <div class="borrow-sub">
                                    <!--<button class="btn">上一步</button>-->
                                    <button class="btn yellow">
                                        提交审核
                                    </button>
								</div>
							</div>
						</div>
					</div>
					</form>
                    </div>
					
                    </div>
                 <%@ include file="/WEB-INF/jsp/global/bottom.jsp"%>
</body>
</html>
<script>
    var applyId = $("#applyId").val();
    layui.use('upload', function () {
        var $ = layui.jquery,
            upload = layui.upload;
        //公司简介
        upload.render({
            elem: '#gsjj',
            url: 'https://p2p.psds.com.cn/fileUpload',
            accept: 'file', //普通文件
            field: 'files',
            data: {
                applyid: applyId,
                type: 1
            },
            done: function (re) {
                var t = $("#gsjj");
                if (re && re.code == "C00000") {
                    $("#gsjj").text("重新上传");
                    var p=t.prev()[0];
                    if (p && p!="") {
                        $(p).html("<a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a>")
                    } else {
                        t.before("<span class='filename'><a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a></span>");
                    }
                    t.parent().prev().find(".type").html("已上传");
                }
            }
        });
        //营业执照
        upload.render({
            elem: '#yyzz',
            url: 'https://p2p.psds.com.cn/fileUpload',
            accept: 'file', //普通文件
            field: 'files',
            data: {
                applyid: applyId,
                type: 2
            },
            //exts: 'zip|rar|7z', //只允许上传压缩文件
            //size: 6000, //限制文件大小，单位 KB
            done: function (re) {
                var t = $("#yyzz");
                if (re && re.code == "C00000") {
                    $("#yyzz").text("重新上传");
                    var p=t.prev()[0];
                    if (p && p!="") {
                        $(p).html("<a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a>")
                    } else {
                        t.before("<span class='filename'><a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a></span>");
                    }
                    t.parent().prev().find(".type").html("已上传");
                }
            }
        });

        //开户许可证
        upload.render({
            elem: '#khxkz',
            url: 'https://p2p.psds.com.cn/fileUpload',
            accept: 'file', //普通文件
            field: 'files',
            data: {
                applyid: applyId,
                type: 3
            },
            //exts: 'zip|rar|7z', //只允许上传压缩文件
            //size: 6000, //限制文件大小，单位 KB
            done: function (re) {
                var t = $("#khxkz");
                if (re && re.code == "C00000") {
                    $("#khxkz").text("重新上传");
                    var p=t.prev()[0];
                    if (p && p!="") {
                        $(p).html("<a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a>")
                    } else {
                        t.before("<span class='filename'><a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a></span>");
                    }
                    t.parent().prev().find(".type").html("已上传");
                }
            }
        });

        //公司章程
        upload.render({
            elem: '#gszc',
            url: 'https://p2p.psds.com.cn/fileUpload',
            accept: 'file', //普通文件
            field: 'files',
            data: {
                applyid: applyId,
                type: 4
            },
            //exts: 'zip|rar|7z', //只允许上传压缩文件
            //size: 6000, //限制文件大小，单位 KB
            done: function (re) {
                var t = $("#gszc");
                if (re && re.code == "C00000") {
                    $("#gszc").text("重新上传");
                    var p=t.prev()[0];
                    if (p && p!="") {
                        $(p).html("<a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a>")
                    } else {
                        t.before("<span class='filename'><a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a></span>");
                    }
                    t.parent().prev().find(".type").html("已上传");
                }
            }
        });

        //法人身份证
        upload.render({
            elem: '#frsfz',
            url: 'https://p2p.psds.com.cn/fileUpload',
            accept: 'file', //普通文件
            field: 'files',
            data: {
                applyid: applyId,
                type: 5
            },
            //exts: 'zip|rar|7z', //只允许上传压缩文件
            //size: 6000, //限制文件大小，单位 KB
            done: function (re) {
                var t = $("#frsfz");
                if (re && re.code == "C00000") {
                    $("#frsfz").text("重新上传");
                    var p=t.prev()[0];
                    if (p && p!="") {
                        $(p).html("<a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a>")
                    } else {
                        t.before("<span class='filename'><a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a></span>");
                    }
                    t.parent().prev().find(".type").html("已上传");
                }
            }
        });

        //近两年审计报告及近期财务报表(打包)
        upload.render({
            elem: '#cwbb',
            url: 'https://p2p.psds.com.cn/fileUpload',
            accept: 'file', //普通文件
            field: 'files',
            data: {
                applyid: applyId,
                type: 6
            },
            exts: 'zip|rar|7z', //只允许上传压缩文件
            //size: 6000, //限制文件大小，单位 KB
            done: function (re) {
                var t = $("#cwbb");
                if (re && re.code == "C00000") {
                    $("#cwbb").text("重新上传");
                    var p=t.prev()[0];
                    if (p && p!="") {
                        $(p).html("<a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a>")
                    } else {
                        t.before("<span class='filename'><a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a></span>");
                    }
                    t.parent().prev().find(".type").html("已上传");
                }
            }
        });

        //当季采购订单
        upload.render({
            elem: '#cgdd',
            url: 'https://p2p.psds.com.cn/fileUpload',
            accept: 'file', //普通文件
            field: 'files',
            data: {
                applyid: applyId,
                type: 7
            },
            //exts: 'zip|rar|7z', //只允许上传压缩文件
            //size: 6000, //限制文件大小，单位 KB
            done: function (re) {
                var t = $("#cgdd");
                if (re && re.code == "C00000") {
                    $("#cgdd").text("重新上传");
                    var p=t.prev()[0];
                    if (p && p!="") {
                        $(p).html("<a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a>")
                    } else {
                        t.before("<span class='filename'><a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a></span>");
                    }
                    t.parent().prev().find(".type").html("已上传");
                }
            }
        });

        //其他
        upload.render({
            elem: '#qt',
            url: 'https://p2p.psds.com.cn/fileUpload',
            accept: 'file', //普通文件
            field: 'files',
            data: {
                applyid: applyId,
                type: 8
            },
            //exts: 'zip|rar|7z', //只允许上传压缩文件
            //size: 6000, //限制文件大小，单位 KB
            done: function (re) {
                var t = $("#qt");
                if (re && re.code == "C00000") {
                    $("#qt").text("重新上传");
                    var p=t.prev()[0];
                    if (p && p!="") {
                        $(p).html("<a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a>")
                    } else {
                        t.before("<span class='filename'><a target='_blank' href='" + re.fileUrl + "'>" + re.name + "</a></span>");
                    }
                    t.parent().prev().find(".type").html("已上传");
                }
            }
        });
    });
</script>