<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c_rt" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>


<html>

<head>
</head>
<body>
<table id="info" bordercolor="#dadada" border="1" align="center">
    <tr border="1">
        <th>编号</th>
        <th>详细地址</th>
        <th>预订日期</th>
        <th>时间段</th>
        <th>预订人</th>
        <th>预订原因</th>
        <th>预订结果</th>
        <th>操作</th>




        <tbody class="tableBody" border="1" id="info_page" >

        <c_rt:forEach var="orderrecord" items="${orderrecord}">
            <tr>

                <td id="0">${orderrecord.getNumber()} </td>
                <td id="1"><p>${orderrecord.getAddress()}</p></td>
                <td id="2">${orderrecord.getOrderdate()}</td>
                <td id="3">${orderrecord.getTime()}</td>
                <td id="4">${orderrecord.getUser()}</td>
                <td id="5">${orderrecord.getReason()}</td>
                <td class="6">${orderrecord.getResult()}</td>
                <input id="hidden_2" type="hidden" value="${orderrecord.getId()}"/>

                <td>
                    <a href="javascript:deleteUser(${orderrecord.getId()});">
                        <img src="images/delete.png" width="20" height="20"></a>

                    <img class="image" src="images/update.png" onclick="update(this)">

                </td>
            </tr>
        </c_rt:forEach>


        </tbody>
</table>
<c_rt:forEach var="classroomorder" items="${classroomorder}">
    <input type="hidden" class="address_info" id="${classroomorder.getAddress()}" value="${classroomorder.getNumber()}"  />
    </c_rt:forEach>
<section id="preview"></section>
<div id="row-fluid">



    <c:choose>
        <c:when test="${page.totalPageCount <= 10}"><!-- 如果总页数小于10，则全部显示 -->
            <c:set var="begin" value="1"></c:set>
            <c:set var="end" value="${page.totalPageCount }"></c:set>
        </c:when>
        <c:when test="${page.pageNow <= 5 }"><!-- 如果总页数小于5，则显示1-10页 -->
            <c:set var="begin" value="1"></c:set>
            <c:set var="end" value="10"></c:set>
        </c:when>
        <c:otherwise><!-- 否则，显示前5页和后5页，保证当前页在中间 -->
            <c:set var="begin" value="${page.pageNow-5 }"></c:set>
            <c:set var="end" value="${page.pageNow+5 }"></c:set>
            <c:if test="${end > page.totalPageCount }"><!-- 如果end值小于总的记录数，则显示最后10页 -->
                <c:set var="end" value="${page.totalPageCount}"></c:set>
                <c:set var="begin" value="${end-10 }"></c:set>
            </c:if>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${page.pageNow != 1 }"><!-- 如果当前页为1，则不显示首页和上一页 -->
            <a href="javascript:server(1)">首页</a>
            <a href="javascript:server(${page.pageNow-1 })">上一页</a>
        </c:when>
    </c:choose>
    <!-- 遍历页码 -->

    <c:forEach begin="${begin }" end="${end }" var="index">
        <c:choose>
            <c:when test="${page.pageNow == index }"><!-- 如果为当前页，则特殊显示 -->
                <a style="height:24px; margin:0 3px; border:none; background:#419ff6;color:white">${index}</a>
            </c:when>
            <c:otherwise><!-- 否则，普通显示 -->
                <a href="javascript:server(${index })">${index }</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:choose>
        <c:when test="${page.pageNow != page.totalPageCount }"><!-- 如果当前页为总的记录数，则不显示末页和下一页 -->
            <a href="javascript:server(${page.pageNow+1 })">下一页</a>
            <a href="javascript:server(${page.totalPageCount })">末页</a>
        </c:when>
    </c:choose>
    共${page.totalPageCount }页，${page.totalCount }条记录 到第<input
        value="${page.pageNow }" name="pn" id="pn_input" />页 <input
        id="pn_btn" type="button" value="确定">


</div>
</body>
</html>
