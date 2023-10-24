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
    <%@include file="/WEB-INF/view/include/head.jsp" %>
    <%@include file="/WEB-INF/view/geeks/head.jsp" %>
</head>

<body>

<div>
    <img src="${common}/assets/images/hanamoney/intro-0.png" width="100%"/>
    <img src="${common}/assets/images/hanamoney/intro-1.png" width="100%"/>
    <img src="${common}/assets/images/hanamoney/intro-2.png" width="100%"/>
    <img src="${common}/assets/images/hanamoney/intro-3.png" width="100%"/>
    <img src="${common}/assets/images/hanamoney/intro-4.png" width="100%"/>
    <div class="card mb-4">
        <div class="card-body">
            <div class="row mt-2 text-center">
                <div class="col-12">
                    <a href="${path}/hanamoney/tos" type="button" class="col-6 btn btn-soft-primary">이용해보기</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>