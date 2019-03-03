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
    <tbody>
    <tr>

        <th>编号</th>
        <th>详细地址</th>
        <th>可容人数</th>
        <th>配置</th>
        <th>操作</th>
    </tr>
    <tbody align="center" class="tableBody" id="info_page">
    <c_rt:forEach var="classroominfoAdmin" items="${classroominfoAdmin}">
        <tr>

            <td>&nbsp;${classroominfoAdmin.number}</td>
            <td>&nbsp;${classroominfoAdmin.address}</td>
            <td>&nbsp;${classroominfoAdmin.capacity}</td>
            <td>&nbsp;${classroominfoAdmin.configuration}</td>
            <td>
                <a href="__URL__/deleteclassroom/id/{$classroominfo.id}"><img src="__IMG__/delete.png" width="20" height="20"></a>
                <img class="image" src="/classroomorder_ThinkPHP/Public/images/update.png" onclick="update(this);">
            </td>

        </tr>
    </c_rt:forEach>
    </tbody>
</table>
<section id="preview"></section>
<div id="row-fluid">
    <c:choose>
        <c:when test="${roominfopage.totalPageCount <= 10}"><!-- 如果总页数小于10，则全部显示 -->
            <c:set var="begin" value="1"></c:set>
            <c:set var="end" value="${roominfopage.totalPageCount }"></c:set>
        </c:when>
        <c:when test="${roominfopage.pageNow <= 5 }"><!-- 如果总页数小于5，则显示1-10页 -->
            <c:set var="begin" value="1"></c:set>
            <c:set var="end" value="10"></c:set>
        </c:when>
        <c:otherwise><!-- 否则，显示前5页和后5页，保证当前页在中间 -->
            <c:set var="begin" value="${roominfopage.pageNow-5 }"></c:set>
            <c:set var="end" value="${roominfopage.pageNow+5 }"></c:set>
            <c:if test="${end > roominfopage.totalPageCount }"><!-- 如果end值小于总的记录数，则显示最后10页 -->
                <c:set var="end" value="${roominfopage.totalPageCount}"></c:set>
                <c:set var="begin" value="${end-10 }"></c:set>
            </c:if>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${roominfopage.pageNow != 1 }"><!-- 如果当前页为1，则不显示首页和上一页 -->
            <a href="javascript:serverAdmin(1);">首页</a>
            <a href="javascript:serverAdmin(${page.pageNow-1})">上一页</a>
        </c:when>
    </c:choose>
    <!-- 遍历页码 -->

    <c:forEach begin="${begin }" end="${end }" var="index">
        <c:choose>
            <c:when test="${roominfopage.pageNow == index }"><!-- 如果为当前页，则特殊显示 -->
                <a style="height:24px; margin:0 3px; border:none; background:#419ff6;color:white">${index}</a>
            </c:when>
            <c:otherwise><!-- 否则，普通显示 -->
                <a href="javascript:serverAdmin(${index })">${index }</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:choose>
        <c:when test="${roominfopage.pageNow != roominfopage.totalPageCount }"><!-- 如果当前页为总的记录数，则不显示末页和下一页 -->
            <a href="javascript:serverAdmin(${roominfopage.pageNow+1 })">下一页</a>
            <a href="javascript:serverAdmin(${roominfopage.totalPageCount })">末页</a>
        </c:when>
    </c:choose>
    共${roominfopage.totalPageCount }页，${roominfopage.totalCount }条记录 到第<input
        value="${page.pageNow }" name="pn" id="pn_input" />页 <input
        id="pn_btn" type="button" value="确定">




</div>
</body>
</html>
