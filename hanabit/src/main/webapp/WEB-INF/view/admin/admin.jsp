<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <%--	<%@include file="/WEB-INF/view/include/head.jsp" %>--%>
    <%@include file="/WEB-INF/view/geeks/head.jsp" %>
</head>

<body>

<!-- Wrapper -->
<div id="db-wrapper">

    <!-- Nav Side Bar-->
    <%@include file="/WEB-INF/view/admin/include/adminSidebar.jsp" %>

    <!-- Page Content -->
    <div id="page-content">
        <div class="header">
            <%@include file="/WEB-INF/view/admin/include/adminNavbar.jsp" %>
        </div>

        <!-- Page Header -->
        <!-- Container fluid -->
        <%@include file="/WEB-INF/view/admin/container/adminDashboard.jsp" %>


    </div>


</div>


<!-- JAVASCRIPT -->
<%@include file="/WEB-INF/view/geeks/includeJS.jsp" %>

</body>

</html>