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
            <div class="container-fluid p-4">
                <div class="row ">
                    <div class="col-lg-12 col-md-12 col-12">
                        <!-- Page header -->
                        <div class="border-bottom pb-4 mb-4 d-md-flex align-items-center justify-content-between">
                            <div class="mb-3 mb-lg-0">
                                <h1 class="mb-0 h2 fw-bold">금융상품 목록 </h1>
                                <!-- Breadcrumb -->
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item">
                                            <a href="${path}/admin">대시보드</a>
                                        </li>
                                        <li class="breadcrumb-item">
                                            <a href="#">금융상품</a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">
                                            금융상품 목록
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- row -->

                <div class="row justify-content-md-between mb-4 mb-xl-0 ">
                    <!-- col -->
                    <div class="col-xl-3 col-lg-4 col-md-6 col-12">
                        <!-- search -->
                        <div class="mb-2 mb-lg-4">
                            <input type="search" class="form-control" placeholder="금융상품 이름 검색" />
                        </div>
                    </div>
                    <div class="col-xxl-1 col-lg-2 col-md-6 col-12 ">
                        <!-- Custom select -->
                        <select class="selectpicker" data-width="100%">
                            <option value="">전체보기</option>
                            <c:forEach items="${categoryDtos}" var="categoryDto">
                                <option value="${categoryDto.name}">${categoryDto.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>


                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-12">
                            <!-- Card -->
                            <div class="card rounded-3">
                                <!-- Card header -->
                                <div class="card-header border-bottom-0 p-0 bg-white">
                                    <div>
                                        <!-- Nav -->
                                        <ul class="nav nav-lb-tab" id="tab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="courses-tab" data-bs-toggle="pill" href="#courses" role="tab" aria-controls="courses" aria-selected="true">모든상품</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="approved-tab" data-bs-toggle="pill" href="#approved" role="tab" aria-controls="approved" aria-selected="false">입출금 예금</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="pending-tab" data-bs-toggle="pill" href="#pending" role="tab" aria-controls="pending" aria-selected="false">정기예금
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="pending-tab2" data-bs-toggle="pill" href="#pending" role="tab" aria-controls="pending" aria-selected="false">적금
                                                </a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                                <div>
                                    <!-- Table -->
                                    <div class="tab-content" id="tabContent">
                                        <!--Tab pane -->
                                        <div class="tab-pane fade show active" id="courses" role="tabpanel" aria-labelledby="courses-tab">
                                            <div class="table-responsive border-0 overflow-y-hidden">
                                                <table class="table mb-0 text-nowrap">
                                                    <thead class="table-light">
                                                    <tr>
                                                        <th scope="col" class="border-0 text-uppercase">
                                                            상품명
                                                        </th>
                                                        <th scope="col" class="border-0 text-uppercase">
                                                            상품종류
                                                        </th>
                                                        <th scope="col" class="border-0 text-uppercase">
                                                            적용금리
                                                        </th>
                                                        <th scope="col" class="border-0 text-uppercase">
                                                            가입금액
                                                        </th>
                                                        <th scope="col" class="border-0 text-uppercase">
                                                            가입기간
                                                        </th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${paging.content}" var="productEntity">
                                                    <tr>
                                                        <td class="border-top-0">
                                                            <a href="#" class="text-inherit">
                                                                <div class="d-lg-flex align-items-center">
<%--                                                                    <div>--%>
<%--&lt;%&ndash;                                                                        <img src="${path}/${productEntity.productImgPath}/${productEntity.productTitleImg}"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                             alt="" class="img-4by3-lg rounded" style="object-fit: cover; width: 10%; height: 10%;"/>&ndash;%&gt;--%>
<%--                                                                        <img src="${common}/assets/images/"--%>
<%--                                                                             alt="" class="img-4by3-lg rounded" style="object-fit: cover; width: 10%; height: 10%;"/>--%>
<%--                                                                    </div>--%>
                                                                    <div class="ms-lg-3 mt-2 mt-lg-0">
                                                                        <h4 class="mb-1 text-primary-hover">
                                                                            ${productEntity.productName}
                                                                        </h4>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </td>
                                                        <td class="align-middle border-top-0">
                                                            <c:choose>
                                                                <c:when test="${productEntity.productCategory == '정기예금'}">
                                                                    <span class="badge bg-light-success text-black fs-13 mt-1">정기예금</span>
                                                                </c:when>
                                                                <c:when test="${productEntity.productCategory == '입출금'}">
                                                                    <span class="badge bg-light-secondary text-black fs-13 mt-1">입출금 예금</span>
                                                                </c:when>
                                                                <c:when test="${productEntity.productCategory == '적금'}">
                                                                    <span class="badge bg-light-danger text-black fs-13 mt-1">적금</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <!-- 예상치 못한 다른 상태에 대한 처리 -->
                                                                    <span class="badge bg-light-info text-black fs-13 mt-1">null</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="align-middle border-top-0">
                                                            <fmt:formatNumber value="${productEntity.productBaseRate + productEntity.productPreferRate}" pattern="#.##" />%

                                                        </td>
                                                        <td class="align-middle border-top-0">
                                                            <fmt:formatNumber value="${productEntity.productMinAmount}"
                                                                              type="currency" currencySymbol="" groupingUsed="true" pattern="#,###" /> ~
                                                            <fmt:formatNumber value="${productEntity.productMaxAmount}"
                                                                              type="currency" currencySymbol="" groupingUsed="true" pattern="#,###" />원

                                                        </td>
                                                        <td class="align-middle border-top-0">
                                                            ${productEntity.productMinPeriod} ~ ${productEntity.productMaxPeriod}개월
                                                        </td>
                                                    </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 페이징 처리 시작 -->
                <div>
                <c:if test="${not empty paging.content}">
                    <ul class="pagination justify-content-center">

                        <!-- 페이지 번호들 -->
                        <c:forEach begin="0" end="${paging.totalPages - 1}" var="pageNum">
                            <c:if test="${pageNum >= (paging.number - 5) && pageNum <= (paging.number + 5)}">
                                <li class="page-item <c:if test="${pageNum == paging.number}">active</c:if>">
                                    <a class="page-link" href="?page=${pageNum}">${pageNum}</a>
                                </li>
                            </c:if>
                        </c:forEach>

                    </ul>
                </c:if>
                </div>
                <!-- 페이징 처리 끝 -->

            </div>
        </div>
    </div>



<!-- JAVASCRIPT -->
<%@include file="/WEB-INF/view/geeks/includeJS.jsp" %>
</body>

</html>