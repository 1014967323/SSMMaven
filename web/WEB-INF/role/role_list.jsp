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
            function deleteRole(name) {
                console.log(name);
                var r = window.confirm("确定要删除此角色吗？");

                $.ajax({
                    url: "deleteRole",
                    type: "post",
                    data: {
                        rolename:name
                    },
                    success: function (data) {

                        if (data == "success") {
                            $("#rolename").val("");
                            showSuccessDiv(true);
                            window.setTimeout("showSuccessDiv(false);", 3000);
                            //window.location.href="role/findRoleName";
                        } else {

                            $("#rolename").val("");
                            showFailDiv(true);
                            window.setTimeout("showFailDiv(false);", 3000);
                        }
                    }
                });
            }
            // 删除成功
            function showSuccessDiv(flag) {
                var divResult = document.getElementById("operate_success_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
            // 删除失败
            function showFailDiv(flag) {
                var divResult = document.getElementById("operate_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
        </script>
        <style type="text/css">
            .operate_success{
                display: none;
            }
            #operate_success_info
            {
                width: 400px;
                line-height: 70px;
                padding-left: 40px;
                font-size: 16px;
                display: none;
                position: absolute;
                z-index: 100;
                top: 90px;
                left: 30%;
            }
            #operate_success_info img
            {
                float: right;
                margin-right: 10px;
                margin-top: 10px;
                cursor: pointer;
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
            <form action="" method="">
                <!--查询-->
                <div class="search_add">
                    <input type="button" value="增加" class="btn_add" onclick="location.href='roleAddView';" />
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除失败！
                </div> <!--删除错误！该角色被使用，不能删除。-->
                <div id="operate_success_info" class="operate_success">
                    <img src="../images/ok.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div> <!--删除错误！该角色被使用，不能删除。-->
                <!--数据区域：用表格展示数据-->     
                <div id="data">                      
                    <table id="datalist">
                        <tr>                            
                            <th>角色 ID</th>
                            <th>角色名称</th>
                            <th class="width600">拥有的权限</th>
                            <th class="td_modi"></th>
                        </tr>
                          <c:forEach items="${hm}"  var="rapn">
                            <tr>
                                <c:set var="row_total" value="${row_total+1}"></c:set>
                                <td><c:out value="${row_total}"></c:out></td>
                                <td>${rapn.key}</td>
                                <td>${rapn.value}</td>
                                <td>
                                    <input type="button" value="修改" class="btn_modify" onclick="location.href='roleModiView?rolename=${rapn.key}';"/>
                                    <input type="button" value="删除" class="btn_delete" onclick="deleteRole('${rapn.key}');" />
                                </td>
                            </tr>
                          </c:forEach>
                    </table>
                </div> 
                <!--分页-->
                <%--<div id="pages">
        	        <a href="#">上一页</a>
                    <a href="#" class="current_page">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">下一页</a>
                </div>--%>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
