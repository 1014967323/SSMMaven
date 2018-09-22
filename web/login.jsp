<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" />
        <script src="../js/jquery-3.3.1.js" type="text/javascript"></script>

        <script>
            // 微博登录
            function wblogin(){
                console.log("wb");
                $.ajax({
                    url: "user/WBLogin",
                    type: "post",

                    success: function (data) {
                        window.location.href = data;
                    }
                });
            }

            // 登录按钮事件
            function userlogin() {
                if (!checkName() || !checkPsw()) {

                } else {

                    console.log($("#username").val());
                    $.ajax({
                        url: "user/UserLogin",
                        type: "post",
                        data: {
                            uid: $("#username").val(),
                            upsw: $("#password").val(),
                            inputyzm:$("#yzm").val(),
                        },
                        success: function (data) {

                            if (data == "yzmerror") {

                                alert("验证码错误");
                                $("#yzm").val("");
                                reloadCheckImg($('#checkyzm'));
                            } else if (data == "success") {

                                $("#username").val("");
                                $("#password").val("");
                                $("#yzm").val("");
                                reloadCheckImg($('#checkyzm'));
                                window.location.href="role/findRoleName";
                            } else {

                                alert("用户名或密码错误");
                                $("#username").val("");
                                $("#password").val("");
                                $("#yzm").val("");
                                reloadCheckImg($('#checkyzm'));
                            }
                        }
                    });
                }
            }

        </script>
        <script>
            // 验证用户名
            function checkName(){
                var reg = /[0-9]{2,13}$/i;
                if(reg.test($("#username").val())){
                    return true;
                }
                alert("用户名不存在");
                return false;
            }
            // 验证密码是否为空
            function checkPsw(){

                if($("#password").val() != ""){
                    return true;
                }
                alert("密码不能为空");
                return false;
            }

        </script>
        <script>
            // 输入提示
            $(function(){
                $("#username").focus(function(){
                    var username = $(this).val();
                    if(username=='请输入账号'){
                        $(this).val('');
                    }
                });

                $("#username").focusout(function(){
                    var username = $(this).val();
                    if(username==''){
                        $(this).val('请输入账号');
                    }
                });

                $("#yzm").focus(function(){
                    var yzm = $(this).val();
                    if(yzm=='请输入验证码'){
                        $(this).val('');
                    }
                });

                $("#yzm").focusout(function(){
                    var yzm = $(this).val();
                    if(yzm==''){
                        $(this).val('请输入验证码');
                    }
                });
            });
        </script>
        <script>
            function reloadCheckImg($img){

                $img.attr("src","img.jsp?t="+(new Date().getTime()));
            }
        </script>
    </head>
    <body class="index">
        <div class="login_box">
            <table>
                <tr>
                    <td class="login_info">账号：</td>
                    <td colspan="2"><input type="text" value="请输入账号" id="username" class="width150" /></td>
                    <%--<td class="login_error_info"><span class="required">30长度的字母、数字和下划线</span></td>--%>
                <tr>
                    <td class="login_info">密码：</td>
                    <td colspan="2"><input id="password" type="password" class="width150" /></td>
                   <%-- <td><span class="required">30长度的字母、数字和下划线</span></td>--%>
                </tr>
                <tr>
                    <td class="login_info">验证码：</td>
                    <td class="width70"><input name="" value="请输入验证码" type="text" id="yzm" class="width70" /></td>
                    <td><a href="javascript:reloadCheckImg($('#checkyzm'))">
                            <img src="img.jsp" alt="验证码" title="点击更换" id="checkyzm"/>
                        </a>
                    </td>
                    <%--<td><span class="required">验证码错误</span></td>  --%>
                </tr>            
                <tr>
                    <td>
                        <a href="QQ/loginView.do"> <img src="images/QQ_login.png" /></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:wblogin()"> <img src="images/WB_login.png"/> </a>
                    </td>
                    <td class="login_button" colspan="2">
                        <a href="javascript:userlogin()"> <img src="images/login_btn.png" /></a>
                    </td>    
                   <%-- <td><span class="required" >用户名或密码错误，请重试</span></td>--%>
                </tr>
            </table>
        </div>
    </body>
</html>
