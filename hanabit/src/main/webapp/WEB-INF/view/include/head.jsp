<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<meta charset="utf-8"/>
<title>(주)원큐하나빗</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content=" "/>
<meta name="keywords" content=""/>
<meta content="Pichforest" name="author"/>

<!-- App favicon -->
<%--<link rel="shortcut icon" href="${resources}/assets/images/favicon.ico">--%>
<link href="${ path }/resources/assets/img/logo.png" rel="icon">
<link href="${ path }/resources/assets/img/logo.png" rel="apple-touch-icon">

<!-- Choise Css -->
<link rel="stylesheet" href="${resources}/assets/libs/choices.js/public/assets/styles/choices.min.css">

<!-- Swiper Css -->
<link rel="stylesheet" href="${resources}/assets/libs/swiper/swiper-bundle.min.css">

<!-- Bootstrap Css -->
<link href="${resources}/assets/css/bootstrap-purple.css" id="bootstrap-style" rel="stylesheet" type="text/css"/>
<!-- Icons Css -->
<link href="${resources}/assets/css/icons.css" rel="stylesheet" type="text/css"/>
<!-- App Css-->
<link href="${resources}/assets/css/app-purple.css" id="app-style" rel="stylesheet" type="text/css"/>
<%--<!--Custom Css-->--%>
<%--<script src="https://kit.fontawesome.com/6bcbeb2a29.js" crossorigin="anonymous"></script>--%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

<style>
    /* 기본적으로 .mobile-only-login 요소를 숨김. */
    .mobile-only-login {
        display: none;
    }

    /* 화면의 너비가 768픽셀 미만일 때만 .mobile-only-login 요소를 보이게. */
    @media (max-width: 767px) {
        .mobile-only-login {
            display: block;
        }
    }
</style>