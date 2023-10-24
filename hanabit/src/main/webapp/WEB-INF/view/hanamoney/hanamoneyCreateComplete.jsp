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

            <!-- ======= Submit Section ======= -->
            <section id="submitForm" class="submitForm">

                <div class="container" data-aos="fade-up" data-aos-delay="100"
                     style="margin-top: 10%; margin-bottom: 5%">
                    <div class="row justify-content-center">
                        <div class="col-lg-6 mt-5">

                            <div class="idcard-form text-center">
                                <div class="text-center">
                                    <img style="width:20%" alt="계좌 생성 이미지"
                                         src="${common}/assets/images/gif/complete.gif">
                                </div>
                                <div class="mt-5">
                                    <h3>이용신청 완료</h3>
                                    <p>하나머니 이용신청이 완료되었습니다.</p>
                                    <div class="row gy-4 mt-3">
                                        <div class="col-lg-12 text-center">
                                            <button class="col-6 btn btn-soft-primary"
                                                    onclick="location.href = '${path}/hanamoney'"> 확인
                                            </button>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <!-- End Submit Form -->
                    </div>
                </div>
            </section>
            <!-- End Submit Section -->

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