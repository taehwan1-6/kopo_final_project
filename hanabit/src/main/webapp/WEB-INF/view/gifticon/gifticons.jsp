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
    <style>
        .page-title-box {
            background-size: cover;
            background-color: #b4a7ee;
            position: relative;
            padding-top: 225px;
            padding-bottom: 110px;
            background-position: center;
        }
    </style>
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
                                <h3 class="mb-4">기프트샵</h3>
                                <div class="page-next">
                                    <nav class="d-inline-block" aria-label="breadcrumb text-center">
                                        <ol class="breadcrumb justify-content-center">
                                            <li class="breadcrumb-item"><a href="${path}/">홈</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"> 기프트샵</li>
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
                        <div class="col-lg-4 col-md-5 ms-auto">
                            <div class="sidebar ms-lg-4 ps-lg-4 mt-5 mt-lg-0">
                                <aside class="widget widget_search">
                                    <form class="position-relative">
                                        <input class="form-control" type="search" placeholder="기프티콘 검색...">
                                        <button class="bg-transparent border-0 position-absolute top-50 end-0 translate-middle-y me-2"
                                                type="submit"><span class="mdi mdi-magnify text-muted"></span></button>
                                    </form>
                                </aside>
                            </div>
                        </div>
                        <!-- 검색창 -->
                    </div>


                    <div class="row">
                        <!-- 챌린지 목록 -->
                        <div class="col-lg-12 col-md-7">
                            <div class="blog-post">
                                <div class="row">

                                    <c:forEach items="${pageGifticons.content}" var="gifticon">
                                        <div class="col-lg-4 mb-4">
                                                <%--                                            <div class="card blog-grid-box p-2">--%>
                                            <div class="blog-box card p-2 mt-3">
                                                <div class="blog-img position-relative overflow-hidden">
                                                    <img src="${path}/${gifticon.gifticonImgPath}/${gifticon.gifticonTitleImg}"
                                                         alt="" class="img-fluid"
                                                         style="object-fit: cover; width: 400px; height: 300px;%">

                                                </div>

                                                <div class="card-body">

                                                    <span class="fs-13 mt-1 mb-2">${gifticon.gifticonBrand}</span>
                                                    <a href="${path}/gifticon/${gifticon.gifticonCode}"
                                                       class="primary-link">
                                                        <h5 class="fs-28">${gifticon.gifticonName}</h5>
                                                    </a>
                                                    <c:choose>
                                                        <c:when test="${fn:length(gifticon.gifticonInfoContent) > 30}">
                                                            <p class="text-muted">${fn:substring(gifticon.gifticonInfoContent, 0, 30)}...</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p class="text-muted">${gifticon.gifticonInfoContent}</p>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <div class="fs-17" style="font-weight: bold"><fmt:formatNumber
                                                            value="${gifticon.gifticonAmount}" pattern="###,###"/> 하나머니
                                                    </div>

                                                    <a href="#" class="form-text text-primary">선물하기 <i
                                                            class="mdi mdi-chevron-right align-middle"></i></a>

                                                </div>
                                            </div><!--end blog-grid-box-->
                                        </div>
                                        <!--end col-->
                                    </c:forEach>
                                </div>


                                <!-- 페이징 처리 시작 -->
                                <div>
                                    <c:if test="${not empty pageGifticons.content}">
                                        <ul class="pagination justify-content-center">
                                            <!-- 이전 버튼 -->
                                                <%--                        <li class="page-item <c:if test="${not paging.hasPrevious}">disabled</c:if>">--%>
                                                <%--                            <a class="page-link" href="?page=${paging.number - 1}">--%>
                                                <%--                                <span>이전</span>--%>
                                                <%--                            </a>--%>
                                                <%--                        </li>--%>

                                            <!-- 페이지 번호들 -->
                                            <c:forEach begin="0" end="${pageGifticons.totalPages - 1}" var="pageNum">
                                                <c:if test="${pageNum >= (pageGifticons.number - 5) && pageNum <= (pageGifticons.number + 5)}">
                                                    <li class="page-item <c:if test="${pageNum == pageGifticons.number}">active</c:if>">
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</body>

</html>