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
                                <h3 class="mb-4" style="color: black">본인인증 완료</h3>
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
            <section class="section" style="padding-top: 30px">
                <div class="container">
                    <div class="row justify-content-center">
                        <img style="width:30%" alt="신분증 업로드" src="${ common }/assets/images/gif/idcard.gif">
                        <div class="mt-4 text-center">
                            <button class="btn btn-soft-primary mt-2 ms-md-2"
                                    onclick="location.href='${path}/account/link/complete'">
                                계좌 연동하기
                            </button>
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

<!-- Modal -->
<%@include file="/WEB-INF/view/account/create/createAccountModal.jsp" %>


<!-- JAVASCRIPT -->
<script>
    // 신분증 업로드
    function idcardUpload() {
        let form = document.idcardUploadForm;
        form.uploadfile.click();
        let btn = form.idcardSubmitBtn;
        btn.style.display = "";
    }
</script>

<script>
    // 인증번호 보내기
    $('#sendAuth').on('click', function authMessage() {

        // 인증번호 창 켜지기
        $('#phoneAuthSection').show()

        // coolsms로 메시지 보내지기
        let telnum = document.getElementById('phoneNumber').value;

        let json = {
            'tel': telnum.toString()
        }

        $.ajax({

            url: '${ path }/auth',
            method: 'post',
            data: JSON.stringify(json),
            contentType: "application/json",
            success: function () {
                console.log('성공');
            },
            error: function () {
                alert('실패');
            }
        })

    })
</script>

<script>
    // 인증번호 입력한거 체크
    $('#checkPhoneAuth').on('click', function authCheck() {
        let authNum = document.getElementById('phoneAuthInput').value;
        let json = {
            'authNum': authNum.toString()
        }

        $.ajax({
            url: '${ path }/auth/check',
            method: 'post',
            data: JSON.stringify(json),
            dataType: 'text',
            contentType: "application/json",
            success: function () {
                console.log('성공');
                $('#phoneWrong').hide()
                $('#phoneAuthSection').append('<div id="phoneCorrect" style="color: #47C83E;">인증 완료되었습니다.</div>')

                // 계좌 개설하기 (다음으로 가기 버튼) 켜지게
                $('#next').removeAttr("disabled");

            },
            error: function () {
                $('#phoneCorrect').hide()
                $('#phoneAuthSection').append('<div id="phoneWrong" style="color: red;">인증번호가 일치하지 않습니다.</div>')
            }
        })
    })
</script>


</body>

</html>