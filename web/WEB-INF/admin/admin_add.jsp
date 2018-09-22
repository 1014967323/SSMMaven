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
        <script language="javascript" type="text/javascript">
            //保存成功的提示消息
            function showResult() {
                var rb = $(":radio");
                var selectedrole;
                rb.each(function () {
                   if ($(this).prop("checked")){
                       console.log($(this).attr("value"));
                       selectedrole = $(this).attr("value")
                   }
                });
                $.ajax({
                    url:"addAdmin",
                    type:"post",
                    data:{
                        uid:$("#uid").val(),
                        uname:$("#uname").val(),
                        uemail:$("#uemail").val(),
                        utel:$("#utel").val(),
                        upsw:$("#psw2").val(),
                        rolename:selectedrole

                    },
                    success:function (data) {
                        if (data == "success") {

                            showSuccessDiv(true);
                            window.setTimeout("showSuccessDiv(false);", 3000);
                        } else {

                            showFailDiv(true);
                            window.setTimeout("showFailDiv(false);", 3000);
                        }
                    }
                });
            }

            // 添加成功
            function showSuccessDiv(flag) {
                var divResult = document.getElementById("add_success_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
            // 添加失败
            function showFailDiv(flag) {
                var divResult = document.getElementById("add_fail_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
        </script>
        <style>
            #add_success_info{
                width: 600px;
                line-height: 50px;
                padding-left: 40px;
                font-size: 14px;
                display: none;
                font-weight:bold;
            }

            #add_fail_info{
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
                    <li><a href="adminListView" class="admin_off"></a></li>
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
                <li><a href="../user/userInfoView" class="information_off"></a></li>
                <li><a href="../user/updatePswView" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <div id="add_success_info" class="save_success">添加成功！</div><!--保存失败，数据并发错误！-->
            <div id="add_fail_info" class="save_fail">添加失败！</div>
            <form action="" method="" class="main_form">
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" id="uname"/>
                        <span class="required">*</span>
                        <%--<div class="validate_msg_long">20长度以内的汉字、字母、数字的组合</div>--%>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info">
                        <input type="text"  id="uid"/>
                        <span class="required">*</span>
                        <%--<div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>--%>
                    </div>
                    <div class="text_info clearfix"><span>密码：</span></div>
                    <div class="input_info">
                        <input type="password"  id="psw1"/>
                        <span class="required">*</span>
                       <%-- <div class="validate_msg_long error_msg">30长度以内的字母、数字和下划线的组合</div>--%>
                    </div>
                    <div class="text_info clearfix"><span>重复密码：</span></div>
                    <div class="input_info">
                        <input type="password"  id="psw2" />
                        <span class="required">*</span>
                        <%--<div class="validate_msg_long error_msg">两次密码必须相同</div>--%>
                    </div>
                <%-- <div class="text_info clearfix"><span>上传头像</span></div>
               <div class="input_info">
                    <input type="file" name="userimg"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long error_msg">图片大小400*400px</div>
                </div>  --%>
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" id="utel"/>
                        <span class="required">*</span>
                        <%--<div class="validate_msg_medium error_msg">正确的电话号码格式：手机或固话</div>--%>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" id="uemail"/>
                        <span class="required">*</span>
                        <%--<div class="validate_msg_medium error_msg">50长度以内，正确的 email 格式</div>--%>
                    </div>
                    <div class="text_info clearfix"><span>角色：</span></div>
                    <div class="input_info_high">
                        <div class="input_info_scroll">
                            <ul>
                                <c:forEach items="${allRole}" var="aR">
                                    <li><input type="radio" name="role" value="${aR.rolename}"/>${aR.rolename}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        <span class="required">*</span>
                        <%--<div class="validate_msg_tiny error_msg">至少选择一个</div>--%>
                    </div>
                    <div class="button_info clearfix">
                        <input type="button" value="添加" class="btn_save" onclick="showResult();" />
                        <input type="button" value="取消" class="btn_save" />
                    </div>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
