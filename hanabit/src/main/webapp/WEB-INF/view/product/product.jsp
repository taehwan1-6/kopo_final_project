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
</head>

<body>
<!-- Page Content -->
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

            <!-- START HOME -->
            <section class="bg-home2" id="home">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-7">
                            <div class="mb-4 pb-3 me-lg-5">
                                <h6 class="sub-title">정기예금</h6>
                                <h3 class="display-5 fw-semibold mb-3">챌린지와 금융상품의 결합 <span
                                        class="text-primary fw-bold">${product.productName}</span></h3>
                                <p class="lead text-muted mb-0">하나빗 챌린지 정기예금과 함께 생활습관과 저축습관 그리고 우대금리까지!</p>
                            </div>
                            <form action="#">
                                <div class="registration-form">
                                    <div class="row g-0">
                                        <div class="col-md-4">
                                            <div class="filter-search-form filter-border mt-3 mt-md-0">
                                                연
                                                <h3><fmt:formatNumber
                                                        value="${product.productBaseRate + product.productPreferRate}"
                                                        pattern="#.##"/>%</h3>
                                                1년 기준, 세전
                                            </div>
                                        </div><!--end col-->
                                        <div class="col-md-4">
                                            <div class="filter-search-form mt-3 mt-md-0">
                                                예치금액
                                                <h3><fmt:formatNumber value="${product.productMaxAmount / 10000}"
                                                                      pattern="###,###,###"/>만원</h3>
                                                최소 <fmt:formatNumber value="${product.productMinAmount / 10000}"
                                                                     pattern="###,###,###"/>만원
                                            </div>
                                        </div><!--end col-->
                                        <div class="col-md-4">
                                            <div class="mt-3 mt-md-0 h-100">
                                                가입기간
                                                <h3>${product.productMinPeriod}개월~</h3>
                                                ${product.productMaxPeriod}개월까지
                                            </div>
                                        </div><!--end col-->
                                        <div class="col-md-4 mt-5">
                                            <div class="mt-3 mt-md-0 h-100">
                                                <button class="btn btn-primary" type="button"
                                                        onclick="location.href='${path}/product/tos'">상품 가입하기
                                                </button>
                                            </div>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                </div>
                            </form>
                        </div>
                        <!--end col-->
                        <div class="col-lg-5">
                            <div class="mt-5 mt-md-0">
                                <img src="${common}/assets/images/gif/term-deposit.gif" alt="" class="home-img"
                                     style="width: 500px"/>
                            </div>
                        </div><!--end col-->
                    </div>
                    <!--end row-->
                </div>
                <!--end container-->
            </section>
            <!-- End Home -->

            <!-- START SHAPE -->
            <div class="position-relative">
                <div class="shape">
                    <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="1440" height="150"
                         preserveAspectRatio="none" viewBox="0 0 1440 220">
                        <g mask="url(&quot;#SvgjsMask1004&quot;)" fill="none">
                            <path d="M 0,213 C 288,186.4 1152,106.6 1440,80L1440 250L0 250z"
                                  fill="rgba(255, 255, 255, 1)"></path>
                        </g>
                        <defs>
                            <mask id="SvgjsMask1004">
                                <rect width="1440" height="250" fill="#ffffff"></rect>
                            </mask>
                        </defs>
                    </svg>
                </div>
            </div>
            <!-- END SHAPE -->

            <!-- START CATEGORY -->
            <section class="section">
                <div class="container">
                    <div class="row justify-content-center">

                        <img src="${common}/assets/images/upload/product/하나빗-챌린지-정기예금.png" alt=""/>

                    </div>
                </div>
            </section>


            <!-- START FAQ-PAGE -->
            <section class="section p-0" style="margin-bottom: 200px">
                <div class="container">
                    <!--end row-->
                    <div class="row align-items-center mt-5">
                        <div class="col-lg-12">
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="generalTab" role="tabpanel"
                                     aria-labelledby="general-tab">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-12">
                                            <div class="accordion accordion-flush faq-box" id="general">
                                                <div class="accordion-item mt-4 border-0">
                                                    <h2 class="accordion-header" id="generalOne">
                                                        <button class="accordion-button collapsed" type="button"
                                                                data-bs-toggle="collapse"
                                                                data-bs-target="#general-one" aria-expanded="true"
                                                                aria-controls="general-one">
                                                            상품안내
                                                        </button>
                                                    </h2>
                                                    <div id="general-one" class="accordion-collapse collapse"
                                                         aria-labelledby="generalOne" data-bs-parent="#general">
                                                        <div class="accordion-body">

                                                        </div>
                                                    </div>
                                                </div><!--end accordion-item-->
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="accordion accordion-flush faq-box" id="generalTwo">
                                                <div class="accordion-item mt-4 border-0">
                                                    <h2 class="accordion-header" id="generaltwo">
                                                        <button class="accordion-button collapsed" type="button"
                                                                data-bs-toggle="collapse" data-bs-target="#general-two"
                                                                aria-expanded="false" aria-controls="general-two">
                                                            금리안내
                                                        </button>
                                                    </h2>
                                                    <div id="general-two" class="accordion-collapse collapse"
                                                         aria-labelledby="generaltwo" data-bs-parent="#general">
                                                        <div class="accordion-body">
                                                            <h5>우대금리</h5>
                                                            <table class="table">
                                                                <thead>
                                                                <tr>
                                                                    <th scope="col">챌린지 횟수</th>
                                                                    <th scope="col">우대금리</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody class="table-group-divider">
                                                                <tr>
                                                                    <th scope="row">10회</th>
                                                                    <td>0.5%</td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row">20회</th>
                                                                    <td>1.0%</td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row">30회</th>
                                                                    <td>1.5%</td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row">40회</th>
                                                                    <td>2.0%</td>
                                                                </tr>
                                                                </tbody>
                                                            </table>

                                                            <div class="mt-5">
                                                                <h5>중도해지금리</h5>
                                                                중도 해지시 원금만 돌려받을 수 있습니다.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div><!--end accordion-item-->
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="accordion accordion-flush faq-box" id="general">
                                                <div class="accordion-item mt-4 border-0">
                                                    <h2 class="accordion-header" id="generalthree">
                                                        <button class="accordion-button collapsed" type="button"
                                                                data-bs-toggle="collapse"
                                                                data-bs-target="#general-three"
                                                                aria-expanded="false" aria-controls="general-three">
                                                            이용안내
                                                        </button>
                                                    </h2>
                                                    <div id="general-three" class="accordion-collapse collapse"
                                                         aria-labelledby="generalthree" data-bs-parent="#general">
                                                        <div class="accordion-body">
                                                        </div>
                                                    </div>
                                                </div><!--end accordion-item-->
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="accordion accordion-flush faq-box" id="general">
                                                <div class="accordion-item mt-4 border-0">
                                                    <h2 class="accordion-header" id="generalfour">
                                                        <button class="accordion-button collapsed" type="button"
                                                                data-bs-toggle="collapse" data-bs-target="#general-four"
                                                                aria-expanded="false" aria-controls="general-four">
                                                            약관 및 상품설명
                                                        </button>
                                                    </h2>
                                                    <div id="general-four" class="accordion-collapse collapse"
                                                         aria-labelledby="generalfour" data-bs-parent="#general">
                                                        <div class="accordion-body">
                                                        </div>
                                                    </div>
                                                </div><!--end accordion-item-->
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

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


</body>

</html>