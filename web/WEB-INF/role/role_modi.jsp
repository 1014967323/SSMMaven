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
            // 修改角色及权限
            function showResult() {
                var cb = $(":checkbox");
                var rp = new Array();
                cb.each(function () {
                    if ($(this).prop("checked")) {
                        var i = new Object();
                        i.pname = $(this).attr("value");
                        i.rolename = $("#uprolename").val();

                        rp.push(i);
                    }
                });
                var js = {
                    rpp:rp
                };

                $.ajax({
                    url: "updateRolePower",
                    type: "post",
                    traditional:true,//这使json格式的字符不会被转码
                    data: JSON.stringify(js),
                    contentType:'application/json;charset=UTF-8',

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
                <li><a href="../role/findRoleName" class="index_on"></a></li>
                <c:if test="${sessionScope.lander.power[0]}" >
                    <li><a href="roleListView" class="role_off"></a></li>
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
                <li><a href="../user/userInfoView" class="information_off"></a></li>
                <li><a href="../user/updatePswView" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">           
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="add_success_info" class="save_success">添加成功！</div><!--保存失败，数据并发错误！-->
            <div id="add_fail_info" class="save_fail">添加失败！</div>
            <form action="" method="" class="main_form">
                <div class="text_info clearfix"><span>角色名称：</span></div>
                <div class="input_info">
                    <input type="text" class="width200" id = "uprolename" value="${rolename}" readonly="true" />
                    <span class="required">*</span>
                    <div class="validate_msg_medium error_msg">不能为空，且为20长度的字母、数字和汉字的组合</div>
                </div>                    
                <div class="text_info clearfix"><span>设置权限：</span></div>
                <div class="input_info_high">
                    <div class="input_info_scroll">
                        <ul>
                            <li><input type="checkbox" value="权限管理" />权限管理</li>
                            <li><input type="checkbox" value="管理员管理" />管理员管理</li>
                            <li><input type="checkbox" value="资费管理"/>资费管理</li>
                            <li><input type="checkbox" value="账务账号"/>账务账号</li>
                            <li><input type="checkbox" value="业务账号"/>业务账号</li>
                            <li><input type="checkbox" value="账单管理"/>账单管理</li>
                            <li><input type="checkbox" value="报表管理"/>报表管理</li>
                        </ul>
                    </div>
                    <span class="required">*</span>
                    <div class="validate_msg_tiny">至少选择一个权限</div>
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
