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
            <!-- end home -->
            <section class="section" style="padding-top: 30px">
                <div class="container">
                    <div class="row justify-content-center">

                        <c:if test="${ not empty idcard }">
                            <form class="idcard-form" action="${ path }/account/create/auth/complete" method="post">
                                <input type="hidden" name="whatIs" value="idcardInfo">
                                <div class="text-center">
                                    <img class="border-img" style="width:30%" alt="idcard"
                                         src="${ common }/assets/images/upload/idcard/${ idcard }">
                                </div>
                                <div class="text-center mt-3 text">
                                    정보를 확인 후 잘못된 경우 수정해주세요
                                </div>
                                <div class="mt-5">
                                    <h5 class="fs-17 fw-semibold mb-3 mb-0">신분증 정보</h5>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label for="firstName" class="form-label">이름</label>
                                                <input type="text" class="form-control" id="firstName"
                                                       value="${ idcardInfo.name }" name="name"/>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label for="personalNum" class="form-label">주민등록번호</label>
                                                <input type="text" class="form-control" id="personalNum"
                                                       value="${ idcardInfo.regNoFront }-${ idcardInfo.regNoBack }"
                                                       name="personalNum"/>
                                            </div>
                                        </div>
                                        <!--end col-->


                                        <h5 class="fs-17 fw-semibold mb-3 mt-3">휴대폰 인증</h5>
                                        <div class="mb-3">
                                            <div class="row align-items-end">
                                                <div class="col-lg-6">
                                                    <label for="phoneNumber" class="form-label">휴대폰 번호</label>
                                                    <input type="text" class="form-control" id="phoneNumber"
                                                           value="01046335639" name="phone"/>
                                                </div>
                                                <div class="col-3">
                                                    <a id="sendAuth" class="primary-link"><h5 class="fs-17 mb-1"
                                                                                              style="text-decoration: underline; cursor: pointer;">
                                                        인증번호 보내기</h5></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="phoneAuthSection" class="mb-3" style="display: none;">
                                            <div class="row align-items-end">
                                                <div class="col-lg-6">
                                                    <input id="phoneAuthInput" type="text" class="form-control" value=""
                                                           placeholder="인증번호를 입력해주세요" name="authNum"/>
                                                </div>
                                                <div class="col-lg-6">
                                                    <a id="checkPhoneAuth" class="primary-link"><h5 class="fs-17 mb-1"
                                                                                                    style="text-decoration: underline; cursor: pointer;">
                                                        인증확인</h5></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="mt-4 text-end">
                                    <button onclick="location.href='${path}/account/create/auth'"
                                            class="btn btn-primary btn-hover mt-2 ms-md-2">신분증 재인증하기
                                    </button>
                                    <button id="next" type="submit" class="btn btn-primary mt-2 ms-md-2">다음으로
                                    </button>
                                </div>

                            </form>
                        </c:if>


                        <!--end row-->
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