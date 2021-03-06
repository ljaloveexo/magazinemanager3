<%--
  Created by IntelliJ IDEA.
  User: isus
  Date: 2019/2/22
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c_rt" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<html>
<head>
<html>
<head>

</head>
<body>
<table id="info" bordercolor="#dadada" border="1" align="center">
    <tr>
        <th>id</th>
        <th>编号</th>
        <th>详细地址</th>
        <th>预订日期</th>
        <th>时间段</th>
        <th>预订人</th>
        <th>预订原因</th>
        <th>操作</th>

    </tr>

    <tbody class="tableBody" align="center" id="info_page">
    <c_rt:forEach var="operation_list" items="${operation_list}">
        <tr>
            <td>&nbsp;${operation_list.id}</td>
            <td>&nbsp;${operation_list.number}</td>
            <td>&nbsp;${operation_list.address}</td>
            <td>&nbsp;${operation_list.orderdate}</td>
            <td>&nbsp;${operation_list.time}</td>
            <td>&nbsp;${operation_list.user}</td>
            <td>&nbsp;${operation_list.reason}</td>
            <td><input name="test"  type="checkbox"
                       value="${operation_list.id}" /></td>



        </tr>
    </c_rt:forEach>
    </tbody>
</table>
<section id="preview"></section>
<div id="row-fluid">
    <c:choose>
        <c:when test="${operation_list_page.totalPageCount <= 10}"><!-- 如果总页数小于10，则全部显示 -->
            <c:set var="begin" value="1"></c:set>
            <c:set var="end" value="${operation_list_page.totalPageCount }"></c:set>
        </c:when>
        <c:when test="${operation_list_page.pageNow <= 5 }"><!-- 如果总页数小于5，则显示1-10页 -->
            <c:set var="begin" value="1"></c:set>
            <c:set var="end" value="10"></c:set>
        </c:when>
        <c:otherwise><!-- 否则，显示前5页和后5页，保证当前页在中间 -->
            <c:set var="begin" value="${operation_list_page.pageNow-5 }"></c:set>
            <c:set var="end" value="${operation_list_page.pageNow+5 }"></c:set>
            <c:if test="${end > operation_list_page.totalPageCount }"><!-- 如果end值小于总的记录数，则显示最后10页 -->
                <c:set var="end" value="${operation_list_page.totalPageCount}"></c:set>
                <c:set var="begin" value="${end-10 }"></c:set>
            </c:if>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${operation_list_page.pageNow != 1 }"><!-- 如果当前页为1，则不显示首页和上一页 -->
            <a href="javascript:serverAdmin(1)">首页</a>
            <a href="javascript:serverAdmin(${operation_list_page.pageNow-1 })">上一页</a>
        </c:when>
    </c:choose>
    <!-- 遍历页码 -->

    <c:forEach begin="${begin }" end="${end }" var="index">
        <c:choose>
            <c:when test="${operation_list_page.pageNow == index }"><!-- 如果为当前页，则特殊显示 -->
                <a style="height:24px; margin:0 3px; border:none; background:#419ff6;color:white">${index}</a>
            </c:when>
            <c:otherwise><!-- 否则，普通显示 -->
                <a href="javascript:serverAdmin(${index })">${index }</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:choose>
        <c:when test="${operation_list_page.pageNow != operation_list_page.totalPageCount }"><!-- 如果当前页为总的记录数，则不显示末页和下一页 -->
            <a href="javascript:serverAdmin(${operation_list_page.pageNow+1 })">下一页</a>
            <a href="javascript:serverAdmin(${operation_list_page.totalPageCount })">末页</a>
        </c:when>
    </c:choose>
    共${operation_list_page.totalPageCount }页，${operation_list_page.totalCount }条记录 到第<input
        value="${operation_list_page.pageNow }" name="pn" id="pn_input" />页 <input
        id="pn_btn" type="button" value="确定">




</div>
</body>
</html>
