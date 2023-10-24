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

            <div class="page-content" style="height: 200px">

                <!-- Start home -->
                <section class="page-title-box" style="background-color: white; padding: 170px;">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-6">
                                <div class="text-center text-white">
                                    <h3 class="mb-4" style="color: black">계좌연동 및 개설</h3>
                                </div>
                            </div>
                            <!--end col-->
                        </div>
                        <!--end row-->
                    </div>
                    <!--end container-->
                    <hr style="color: black; height: 2px;">
                </section>
                <!-- end home -->

                <!-- START SHAPE -->

            </div>
            <!-- END SHAPE -->


            <!-- START SERVICE-PAGE -->
            <section class="section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <div class="section-title text-center">
                                <h4 class="title mb-4">하나은행 계좌 연동 및 개설하기</h4>
<%--                                <h4 class="title mb-4">하나랜드 서비스를 이용할 수 있어요</h4>--%>
                                <p class="text-muted">계좌 연동 및 개설에는 신분증 또는 운전면허증이 필요해요</p>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->

                    <div class="row justify-content-center" style="margin-left: 20px; " >

                        <div class="col-lg-4 col-md-6" style="border: 1px gray solid; margin: 5px;">
                            <div class="card service-box mt-4">
                                <div class="card-body p-4">
                                    <div class="service-icon icons-md">
                                        <i class="fa-solid fa-money-check-dollar" style="font-size: 35px; color: #7a60f2"></i>
                                    </div>
                                    <div class="mt-4">
                                        <h5>기존 하나은행 계좌를 소유하고 있어요</h5>
                                        <p class="text-muted">신분증을 통해 이미 가지고 있는 하나은행 계좌를 연동할 수 있어요</p>
                                    </div>
                                    <div class="learn-more">
                                        <a href="${path}/account/link/auth" class="form-text">계좌 연동하기 <i class="uil uil-angle-right-b"></i></a>
                                    </div>
                                </div>

                            </div><!--end service-->
                        </div><!--end col-->

                        <div class="col-lg-4 col-md-6 justify-content-cente" style="border: 1px gray solid; margin: 5px;">
                            <div class="card service-box mt-4">
                                <div class="card-body p-4">
                                    <div class="service-icon icons-md">
                                        <i class="fa-solid fa-pen-to-square"  style="font-size: 35px; color: #7a60f2"></i>
                                    </div>
                                    <div class="mt-4">
                                        <h5>하나은행 계좌를 소유하고 있지 않아요</h5>
                                        <p class="text-muted">계좌개설을 통해 하나은행 계좌를 개설 후 원큐하나빗 서비스를 이용할 수 있어요</p>
                                        <div class="learn-more">
                                            <a href="${path}/account/create/tos" class="form-text">계좌 개설하기 <i class="uil uil-angle-right-b"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end service-->
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </section>
            <!-- END SERVICE-PAGE -->
        </div>
        <!-- End Page-content -->


        <!-- START FOOTER -->
        <%@include file="/WEB-INF/view/include/footer.jsp" %>
        <!-- END FOOTER -->


    </div>
    <!-- end main content-->


<!-- JAVASCRIPT -->



</body>

</html>