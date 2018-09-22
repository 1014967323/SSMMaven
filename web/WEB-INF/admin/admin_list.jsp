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
            //显示角色详细信息
            function showDetail(flag, a) {
                var detailDiv = a.parentNode.getElementsByTagName("div")[0];
                if (flag) {
                    detailDiv.style.display = "block";
                }
                else
                    detailDiv.style.display = "none";
            }
            //重置密码
            function resetPwd() {
                var cb = $(":checkbox");
                var b = false;
                var uids = new Array();
                cb.each(function () {
                    if ($(this).prop("checked")) {
                        b = true;
                        console.log($(this).attr("value"));
                        if ($(this).attr("value") != 0){
                            uids.push($(this).attr("value"));
                        }

                    }
                });
                if (!b){
                    alert("请至少选择一条数据！");
                    return false;
                }
                $.ajax({
                    url:"resetPsw",
                    type:"post",
                    traditional:true,//这使json格式的字符不会被转码
                    data: JSON.stringify(uids),
                    contentType:'application/json;charset=UTF-8',
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

                //document.getElementById("operate_result_info").style.display = "block";
            }
            //删除
            function deleteAdmin(userid) {
                var r = window.confirm("确定要删除此管理员吗？");
                $.ajax({
                    url:"delAdmin",
                    type:"post",
                    traditional:true,//这使json格式的字符不会被转码
                    data: {
                        uid:userid
                    },
                    success:function (data) {
                        if (data == "success") {


                        } else {


                        }
                    }
                });

                //document.getElementById("operate_result_info").style.display = "block";
            }
            //全选
            function selectAdmins(inputObj) {
                var inputArray = document.getElementById("datalist").getElementsByTagName("input");
                for (var i = 1; i < inputArray.length; i++) {
                    if (inputArray[i].type == "checkbox") {
                        inputArray[i].checked = inputObj.checked;
                    }
                }
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
            <form action="" method="">
                <!--查询-->
                <div class="search_add">
                    <%--<div>
                        模块：
                        <select id="selModules" class="select_search">
                            <option>全部</option>
                            <option>角色管理</option>
                            <option>管理员管理</option>
                            <option>资费管理</option>
                            <option>账务账号</option>
                            <option>业务账号</option>
                            <option>账单管理</option>
                            <option>报表</option>
                        </select>
                    </div>
                    <div>角色：<input type="text" value="" class="text_search width200" /></div>
                    <div><input type="button" value="搜索" class="btn_search"/></div>--%>
                    <input type="button" value="密码重置" class="btn_add" onclick="resetPwd();" />
                    <input type="button" value="增加" class="btn_add" onclick="location.href='adminAddView';" />
                </div>
                <!--删除和密码重置的操作提示-->
                <%--<div id="operate_result_info" class="operate_fail">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    <span>删除失败！数据并发错误。</span><!--密码重置失败！数据并发错误。-->
                </div> --%>
                <div id="add_success_info" class="save_success">重置成功！</div><!--保存失败，数据并发错误！-->
                <div id="add_fail_info" class="save_fail">重置失败！</div>
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th class="th_select_all">
                                <input type="checkbox" onclick="selectAdmins(this);" value="0"/>
                                <span>全选</span>
                            </th>
                            <th>管理员ID</th>
                            <th>姓名</th>
                            <th>登录账号</th>
                            <th>电话</th>
                            <th>电子邮件</th>
                            <th>授权日期</th>
                            <th class="width100">拥有角色</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${adminInfo}" var="aI">
                        <tr>
                            <td><input type="checkbox" value="${aI.uid}"/></td>
                            <c:set var="row_total" value="${row_total+1}"></c:set>
                            <td><c:out value="${row_total}"></c:out></td>
                            <td>${aI.uname}</td>
                            <td>${aI.uid}</td>
                            <td>${aI.utel}</td>
                            <td>${aI.uemail}</td>
                            <td>${aI.rolegrantdate}</td>
                            <td>
                                <a class="summary"  onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);">${aI.rolename}</a>
                                <!--浮动的详细信息-->
                                <div class="detail_info">
                                        ${aI.rolename}
                                </div>
                            </td>
                            <td class="td_modi">
                                <input type="button" value="修改" class="btn_modify" onclick="location.href='adminModiView?uid=${aI.uid}'" />
                                <input type="button" value="删除" class="btn_delete" onclick="deleteAdmin('${aI.uid}');" />
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
                </div> --%>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
