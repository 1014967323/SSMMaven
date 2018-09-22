<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
        <script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
        <script type="text/javascript">
            function showResult(){
                if ($("#newpassword1").val() != $("#newpassword2").val()){
                    alert("新密码两次输入不一致,请重新输入");
                    $("#newpassword1").val("");
                    $("#newpassword2").val("");
                }else if ($("#newpassword1").val() == "" || $("#newpassword2").val() == "") {
                    alert("密码不可为空,请重新输入");
                    $("#newpassword1").val("");
                    $("#newpassword2").val("");
                }else {
                    $.ajax({
                        url: "updatePsw",
                        type: "post",
                        data: {
                            upsw: $("#newpassword2").val(),

                        },
                        success: function (data) {

                            if (data == "success") {
                                showSuccessDiv(true);
                                window.setTimeout("showSuccessDiv(false);", 3000);
                                //window.location.href="role/findRoleName";
                            } else {
                                showFailDiv(true);
                                window.setTimeout("showFailDiv(false);", 3000);
                            }
                        }
                    });
                }
            }

            // 修改成功
            function showSuccessDiv(flag) {
                var divResult = document.getElementById("save_success_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
            // 修改失败
            function showFailDiv(flag) {
                var divResult = document.getElementById("save_fail_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
        </script>
        <script type="text/javascript">
            $(function () {
                $("#newpassword1").focus(function () {
                    if (($("#oldpassword").val() != "") && ($("#oldpassword").val() != ${sessionScope.lander.upsw})){
                        alert("原密码输入错误");
                        $("#oldpassword").val("");
                    }
                });
            });
        </script>
        <style>
            #save_success_info{
                width: 600px;
                line-height: 50px;
                padding-left: 40px;
                font-size: 14px;
                display: none;
                font-weight:bold;
            }

            #save_fail_info{
                width: 600px;
                line-height: 50px;
                padding-left: 40px;
                font-size: 14px;
                display: none;
                font-weight:bold;
            }
        </style>
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <ul id="menu">

                <li><a href="../role/findRoleName" class="index_off"></a></li>
                <c:if test="${sessionScope.lander.power[0]}" >
                    <li><a href="../role/roleListView" class="role_off"></a></li>
                </c:if>
                <c:if test="${sessionScope.lander.power[1]}" >
                    <li><a href="../admin/adminListView" class="admin_off"></a></li>
                </c:if>
                <c:if test="${sessionScope.lander.power[2]}" >
                    <li><a href="../fee/feeListView" class="fee_off"></a></li>
                </c:if>
                <c:if test="${sessionScope.lander.power[3]}" >
                    <li><a href="../account/accountListView" class="account_off"></a></li>
                </c:if>
                <c:if test="${sessionScope.lander.power[4]}" >
                    <li><a href="../service/serviceListView" class="service_off"></a></li>
                </c:if>
                <c:if test="${sessionScope.lander.power[5]}" >
                    <li><a href="../bill/billListView" class="bill_off"></a></li>
                </c:if>
                <c:if test="${sessionScope.lander.power[6]}" >
                    <li><a href="../report/reportListView" class="report_off"></a></li>
                </c:if>
                <li><a href="userInfoView" class="information_off"></a></li>
                <li><a href="updatePswView" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <div id="main">      
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_success_info" class="save_success">修改成功！</div><!--保存失败，数据并发错误！-->
            <div id="save_fail_info" class="save_fail">修改失败！</div>
            <form action="" method="" class="main_form">
                <div class="text_info clearfix"><span>旧密码：</span></div>
                <div class="input_info">
                    <input type="password" id="oldpassword" class="width200"  /><span class="required">*</span>
                    <div class="validate_msg_medium">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>新密码：</span></div>
                <div class="input_info">
                    <input type="password" id="newpassword1" class="width200" /><span class="required">*</span>
                    <div class="validate_msg_medium">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复新密码：</span></div>
                <div class="input_info">
                    <input type="password" id="newpassword2" class="width200"  /><span class="required">*</span>
                    <div class="validate_msg_medium">两次新密码必须相同</div>
                </div>
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="showResult();" />
                    <input type="button" value="取消" class="btn_save" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
