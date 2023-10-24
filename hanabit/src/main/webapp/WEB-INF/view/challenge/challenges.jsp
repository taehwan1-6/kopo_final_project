<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/view/include/head.jsp" %>
</head>

<body>

<!--start page Loader -->
<div id="preloader">
    <div id="status">
        <ul>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>
<!--end page Loader -->


<!-- Begin page -->
<div>

    <!-- START TOP-BAR -->
    <%@include file="/WEB-INF/view/include/topbar.jsp" %>
    <!-- END TOP-BAR -->

    <!-- Navbar Start-->
    <%@include file="/WEB-INF/view/include/navbar.jsp" %>
    <!-- Navbar End -->


    <div class="main-content">

        <div class="page-content">


            <!-- Start home -->
            <section class="page-title-box">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <div class="text-center text-white">
                                <h3 class="mb-4">챌린지 목록</h3>
                                <div class="page-next">
                                    <nav class="d-inline-block" aria-label="breadcrumb text-center">
                                        <ol class="breadcrumb justify-content-center">
                                            <li class="breadcrumb-item"><a href="${path}/">홈</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"> 챌린지 목록</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->
                </div>
                <!--end container-->
            </section>
            <!-- end home -->

            <!-- START SHAPE -->
            <div class="position-relative" style="z-index: 1">
                <div class="shape">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 250">
                        <path fill="#FFFFFF" fill-opacity="1"
                              d="M0,192L120,202.7C240,213,480,235,720,234.7C960,235,1200,213,1320,202.7L1440,192L1440,320L1320,320C1200,320,960,320,720,320C480,320,240,320,120,320L0,320Z"></path>
                    </svg>
                </div>
            </div>
            <!-- END SHAPE -->


            <!-- START BLOG-GRID -->
            <section class="section">
                <div class="container">

                    <div class="row">
                        <!-- 검색창 -->
                        <div class="col-lg-4 col-md-5 ms-auto"> <!-- ms-auto 클래스를 추가하여 이전 열들을 왼쪽으로 밀어냅니다. -->
                            <div class="sidebar ms-lg-4 ps-lg-4 mt-5 mt-lg-0">
                                <aside class="widget widget_search">
                                    <form class="position-relative">
                                        <input class="form-control" type="search" placeholder="챌린지 검색...">
                                        <button class="bg-transparent border-0 position-absolute top-50 end-0 translate-middle-y me-2"
                                                type="submit"><span class="mdi mdi-magnify text-muted"></span></button>
                                    </form>
                                </aside>
                            </div>
                        </div>
                        <!-- 검색창 -->
                    </div>

                    <div class="row">
                        <!-- 카테고리 -->
                        <div class="row">
                            <div class="col-2 mt-4 pt-2">
                                <div class="popu-category-box text-center rounded-circle">
                                    <img src="${resources}/assets/upload/category/challenge.png"
                                         alt="" class="img-fluid" width="50%">
                                    <div class="popu-category-content mt-1">
                                        <a href="${path}/challenges" class="text-dark stretched-link">
                                            <h5 class="fs-18">전체보기</h5>
                                        </a>
                                    </div>
                                </div><!--end popu-category-box-->
                            </div>
                            <!--end col-->
                            <c:forEach items="${categories}" var="category">
                                <div class="col-2 mt-4 pt-2">
                                    <div class="popu-category-box text-center rounded-circle">
                                        <img src="${resources}/${category.imgPath}/${category.imgName}"
                                             alt="" class="img-fluid" width="50%">
                                        <div class="popu-category-content mt-1">
                                            <a href="${path}/challenges/category/${category.name}"
                                               class="text-dark stretched-link">
                                                <h5 class="fs-18">${category.name}</h5>
                                            </a>
                                        </div>
                                    </div><!--end popu-category-box-->
                                </div>
                                <!--end col-->
                            </c:forEach>
                        </div>
                        <!-- 카테고리 -->
                    </div>


                    <div class="row">
                        <!-- 챌린지 목록 -->
                        <div class="col-lg-12 col-md-7">
                            <div class="blog-post">
                                <div class="row">

                                    <c:forEach items="${pagingChallenges.content}" var="challengeDto">
                                        <div class="col-lg-4 mb-4">
                                            <div class="blog-box card p-2 mt-3"
                                                 style="object-fit: cover; width: 360px; height: 500px;">
                                                <div class="blog-img position-relative overflow-hidden">
                                                    <img src="${path}/${challengeDto.challengeImgPath}/${challengeDto.challengeTitleImg}"
                                                         alt="" class="img-fluid"
                                                         style="object-fit: cover; width: 400px; height: 300px;">

                                                </div>

                                                <div class="card-body">

                                                    <span class="badge bg-soft-success fs-13 mt-1 mb-2">${challengeDto.challengeStatus}중</span>
                                                    <a href="${path}/challenges/${challengeDto.challengeCode}"
                                                       class="primary-link">
                                                        <h5 class="fs-17">${challengeDto.challengeName}</h5>
                                                    </a>
                                                    <c:choose>
                                                        <c:when test="${fn:length(challengeDto.challengeInfoSummary) > 30}">
                                                            <p class="text-muted">${fn:substring(challengeDto.challengeInfoSummary, 0, 30)}...</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p class="text-muted">${challengeDto.challengeInfoSummary}</p>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <a href="#" class="form-text text-primary">참여해보기 <i
                                                            class="mdi mdi-chevron-right align-middle"></i></a>

                                                </div>
                                            </div><!--end blog-grid-box-->
                                        </div>
                                        <!--end col-->
                                    </c:forEach>
                                </div>


                                <div>
                                    <c:if test="${not empty pagingChallenges.content}">
                                        <ul class="pagination justify-content-center">
                                            <!-- 이전 버튼 -->
                                                <%--                        <li class="page-item <c:if test="${not paging.hasPrevious}">disabled</c:if>">--%>
                                                <%--                            <a class="page-link" href="?page=${paging.number - 1}">--%>
                                                <%--                                <span>이전</span>--%>
                                                <%--                            </a>--%>
                                                <%--                        </li>--%>

                                            <!-- 페이지 번호들 -->
                                            <c:forEach begin="0" end="${pagingChallenges.totalPages - 1}" var="pageNum">
                                                <c:if test="${pageNum >= (pagingChallenges.number - 5) && pageNum <= (pagingChallenges.number + 5)}">
                                                    <li class="page-item <c:if test="${pageNum == pagingChallenges.number}">active</c:if>">
                                                        <a class="page-link" href="?page=${pageNum}">${pageNum}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>

                                            <!-- 다음 버튼 -->
                                                <%--                        <li class="page-item <c:if test="${not paging.hasNext}">disabled</c:if>">--%>
                                                <%--                            <a class="page-link" href="?page=${paging.number + 1}">--%>
                                                <%--                                <span>다음</span>--%>
                                                <%--                            </a>--%>
                                                <%--                        </li>--%>
                                        </ul>
                                    </c:if>
                                </div>
                                <!-- 페이징 처리 끝 -->

                            </div><!--end blog-post-->
                        </div><!--end col-->
                        <!-- 챌린지 목록 -->
                    </div><!--end row-->


                </div><!--end container-->
            </section>
            <!-- END BLOG-GRID -->


        </div>
        <!-- End Page-content -->


        <!-- START FOOTER -->
        <%@include file="/WEB-INF/view/include/footer.jsp" %>
        <!-- END FOOTER -->


    </div>
    <!-- end main content-->

</div>
<!-- END layout-wrapper -->

<!-- JAVASCRIPT -->
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</body>

</html>