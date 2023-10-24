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
                <%@include file="/WEB-INF/view/include/home.jsp" %>
                <!-- End Home -->

                <!-- START SHAPE -->
                <div class="position-relative">
                    <div class="shape">
                        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="1440" height="150"
                             preserveAspectRatio="none" viewBox="0 0 1440 220">
                            <g mask="url(&quot;#SvgjsMask1004&quot;)" fill="none">
                                <path d="M 0,213 C 288,186.4 1152,106.6 1440,80L1440 250L0 250z" fill="rgba(255, 255, 255, 1)"></path>
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
                <%@include file="/WEB-INF/view/include/category.jsp" %>
                <!-- END CATEGORY -->

                <!-- START BLOG -->
                <!-- END BLOG -->


                <!-- START JOB-LIST -->
                <!-- END JOB-LIST -->



                <!-- START CLIENT -->
                <!-- END CLIENT -->

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