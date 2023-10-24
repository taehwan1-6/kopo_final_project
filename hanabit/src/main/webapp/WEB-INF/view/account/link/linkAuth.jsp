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

            <section class="page-title-box" style="background-color: white; padding: 170px; padding-bottom: 0px;">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <div class="text-center text-white">
                                <h3 class="mb-4" style="color: black">본인 인증</h3>
                            </div>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->
                </div>
                <!--end container-->
                <hr style="color: black; height: 2px;">
            </section>

            <c:if test="${ empty currentMember.personalNum }">
                <!-- end home -->
                <section class="section" style="padding-top: 0px">
                    <div class="container">
                        <div class="row justify-content-center">

                            <!-- 신분증 업로드 -->
                            <form class="idcard-form" method="post" action="${ path }/account/link/auth"
                                  enctype="multipart/form-data" name="idcardUploadForm">
                                <input type="hidden" name="isLinkedAccount" value="idcardUpload">
                                <input type="file" name="uploadfile" multiple="multiple" style="display:none"/>

                                <div class="text-center m-5">
                                    <img style="width:30%" alt="신분증 업로드" src="${ common }/assets/images/gif/idcard.gif">
                                </div>
                                <div class="text-center">
                                    <button onclick="idcardUpload()" type="button" class="btn btn-soft-primary">
                                        <c:if test="${ empty idcard }"> 신분증 인증하기 </c:if>
                                        <c:if test="${ not empty idcard }"> 신분증 재인증하기 </c:if>
                                    </button>
                                    <button class="btn btn-soft-primary" name="idcardSubmitBtn" type="submit"
                                            style="display:none"> 제출
                                    </button>
                                </div>
                            </form>

                            <!--end row-->
                        </div>
                    </div>
                </section>
            </c:if>

            <c:if test="${ not empty currentMember.personalNum }">
                <!-- end home -->
                <section class="section" style="padding-top: 0px">
                    <div class="container">
                        <div class="row justify-content-center">
                            <h3 class="text-center mt-3">이미 본인인증을 한 회원입니다.</h3>
                            <img style="width:30%" alt="신분증 업로드" src="${ common }/assets/images/gif/idcard.gif">
                            <div class="mt-4 text-center">
                                <button class="btn btn-soft-primary mt-2 ms-md-2"
                                        onclick="location.href='${path}/account/link/complete'">
                                    계좌 연동하기
                                </button>
                            </div>

                            <!--end row-->
                        </div>
                    </div>
                </section>
            </c:if>


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
<script>
    function idcardUpload() {
        let form = document.idcardUploadForm;
        form.uploadfile.click();
        let btn = form.idcardSubmitBtn;
        btn.style.display = "";
    }
</script>


</body>

</html>