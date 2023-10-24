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
        <div class="container-fluid p-4">
            <div class="row ">
                <div class="col-lg-12 col-md-12 col-12">
                    <!-- Page header -->
                    <div class="border-bottom pb-4 mb-4 d-md-flex align-items-center justify-content-between">
                        <div class="mb-3 mb-lg-0">
                            <h1 class="mb-0 h2 fw-bold">하나은행 설정 </h1>
                            <!-- Breadcrumb -->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="${path}/admin">대시보드</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="#">사이트 설정</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        하나은행 설정
                                    </li>
                                </ol>
                            </nav>
                        </div>
                        <!-- button -->
                        <div>
                            <a href="#" class="btn btn-primary me-2" data-bs-toggle="offcanvas"
                               data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                                챌린지 개설하기
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- row -->

            <div class="row">
                <div class="offset-xl-3 col-xl-6 offset-lg-2 col-lg-8 col-md-12 col-12">
                    <!-- Card -->
                    <div class="card mb-4">
                        <!-- Card header -->
                        <div class="card-header d-flex align-items-center justify-content-between">
                            <h4 class="mb-0">하나은행 설정</h4>
                            <div class="form-check form-switch">
                                <input type="checkbox" class="form-check-input" id="googleSwitch">
                                <label class="form-check-label" for="googleSwitch"></label>
                            </div>
                        </div>
                        <!-- Card body -->
                        <div class="card-body">
                            <form method="post" action="${path}/admin/api-setting">
                                <div class="mb-3">
                                    <input type="hidden" name="company" value="하나은행">
                                    <label for="apiKey" class="form-label">하나은행 계좌관련 API KEY
                                    </label>
                                    <input class="form-control" id="apiKey"
                                           name="apiKey" type="text" placeholder="${hanabankApi.apiKey}">
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    설정하기
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<!-- JAVASCRIPT -->
<%@include file="/WEB-INF/view/geeks/includeJS.jsp" %>
</body>

</html>