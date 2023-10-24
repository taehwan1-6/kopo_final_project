<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="challengePath" value="${pageContext.request.contextPath}/common/assets/images/upload/challenge"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/view/include/head.jsp" %>
    <style>
        a {
            color: black;
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
                                <h3 class="mb-4">챌린지 정보</h3>
                                <div class="page-next">
                                    <nav class="d-inline-block" aria-label="breadcrumb text-center">
                                        <ol class="breadcrumb justify-content-center">
                                            <li class="breadcrumb-item"><a href="${path}/">홈</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"> 챌린지 정보</li>
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

            <!-- START CANDIDATE-DETAILS -->
            <section class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card side-bar">
                                <div class="candidate-contact-details card-body p-4 border-top">
                                    <h6 class="fs-17 fw-semibold mb-3"></h6>
                                    <ul class="list-unstyled mb-0">
                                        <li>
                                            <div class="d-flex align-items-center mt-4">
                                                <div class="icon bg-soft-primary flex-shrink-0">
                                                    <i class="uil uil-fire"></i>
                                                </div>
                                                <div class="ms-3">
                                                    <a href="${path}/challenges"><h6 class="fs-14 mb-1">챌린지</h6></a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex align-items-center mt-4">
                                                <div class="icon bg-soft-primary flex-shrink-0">
                                                    <i class="uil uil-gift"></i>
                                                </div>
                                                <div class="ms-3">
                                                    <a href="${path}/gifticon"><h6 class="fs-14 mb-1">기프트샵</h6></a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex align-items-center mt-4">
                                                <div class="icon bg-soft-primary flex-shrink-0">
                                                    <i class="uil uil-shopping-basket"></i>
                                                </div>
                                                <div class="ms-3">
                                                    <a href="${path}/product"><h6 class="fs-14 mb-1">금융상품</h6></a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex align-items-center mt-4">
                                                <div class="icon bg-soft-primary flex-shrink-0">
                                                    <i class="uil uil-user-square"></i>
                                                </div>
                                                <div class="ms-3">
                                                    <a href="${path}/my-challenge"><h6 class="fs-14 mb-1">마이페이지</h6></a>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div><!--end candidate-overview-->
                            </div><!--end card-->
                        </div><!--end col-->

                        <div class="col-lg-8">
                            <div class="card candidate-details ms-lg-4 mt-4 mt-lg-0">
                                <div class="card-body p-4 candidate-personal-detail">
                                    <div class="row justify-content-center bor">
                                        <div class="col-lg-12">
                                            <div class="text-center mb-5">
                                                <p class="text-primary fw-semibold mb-0">${challengeDto.challengeCategory}</p>
                                                <h3>${challengeDto.challengeName}</h3>
                                                <div class="text-center mt-3">
                                                    <img src="${path}/${challengeDto.challengeImgPath}/${challengeDto.challengeTitleImg}"
                                                         alt="" class="img-fluid rounded-3">
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <%--                                        <form action="${path}/gifticon/gift" method="post">--%>
                                    <div class="candidate-education-details pt-3">
                                        <div class="mt-3">
                                            <h3><i class="fas fa-coins text-warning"></i>리워드 하나머니</h3>
                                            <div class="p-4">
                                                <div style="color: black" ;>
                                                    <h4><fmt:formatNumber value="${challengeDto.challengeRewardAmount}"
                                                                          pattern="###,###"/>원
                                                    </h4>
                                                </div>
                                            </div>
                                            <hr>
                                        </div>
                                    </div>

                                    <div class="candidate-education-details pt-3">
                                        <h3 class="mt-3"><i class="fas fa-fire text-danger"></i>챌린지 소개</h3>
                                        <p>
                                            ${challengeDto.challengeInfoSummary}
                                        </p>
                                        <p class="text-muted mb-2">
                                        <div style="color: black" ;>
                                            ${challengeDto.challengeInfoContent}
                                        </div>
                                        </p>
                                        <hr>
                                    </div><!--end candidate-education-details-->

                                    <div class="candidate-education-details mt-4 pt-3">
                                        <h3 class="mt-3"><i class="fas fa-check text-success"></i>이렇게 인증해 주세요</h3>
                                        <p class="text-muted mb-2">
                                        <div style="color: black" ;>
                                            ${challengeDto.challengeAuthContent}
                                        </div>
                                        <div class="row mt-3 mb-5">
                                            <div class="col-6">
                                                <h5 class="text-success">인증 사진 예시</h5>
                                                <img src="${path}/${challengeDto.challengeImgPath}/${challengeDto.challengeAuthImg}"
                                                     width="50%" alt="" class="img-fluid">
                                            </div>
                                        </div>
                                        </p>
                                    </div><!--end candidate-education-details-->


                                    <div class="text-end">
                                        <%--                                                <button type="submit" id="sendGifticon" class="btn btn-primary btn-hover"><i class="uil uil-gift"></i> 결제하기</button>--%>
                                        <button id="markmodalbtn" class="btn btn-primary"
                                                data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i
                                                class="uil uil-camera"></i> 사진 인증하기
                                        </button>
                                    </div>

                                    <div class="mt-5">
                                        <ul class="blog-social-menu list-inline mb-0 text-end">
                                            <li class="list-inline-item">
                                                <b>SNS 공유하기:</b>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="javascript:void(0)" class="social-link bg-soft-primary">
                                                    <i class="uil uil-instagram-alt"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a id="kakaotalk-sharing-btn" href="javascript:;"
                                                   class="social-link bg-soft-warning">
                                                    <img src="${resources}/assets/upload/logo/kakao.png" width="50%">
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="javascript:void(0)" class="social-link bg-soft-blue">
                                                    <i class="uil uil-facebook-f"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="javascript:void(0)" class="social-link bg-soft-danger">
                                                    <i class="uil uil-envelope"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>


                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </section>
            <!-- END CANDIDATE-DETAILS -->


        </div><!--end row-->
    </div><!--end container-->
    </section>
    <!-- START BLOG-DETAILS -->


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

<!-- 챌린지 사진 인증 모달 -->
<%@include file="/WEB-INF/view/challenge/challengeAuthModal.jsp" %>
<%@include file="/WEB-INF/view/challenge/challengeSuccessModal.jsp" %>
<%@include file="/WEB-INF/view/challenge/challengeFailModal.jsp" %>

<script>
    $('#complete').hide()
    $('#fail').hide()

    function remarkclick() {
        $('#failClose').trigger('click')
        $('#markmodalbtn').trigger('click')
    }

    function readImage(input) {
        if (input.files && input.files[0]) {
            const reader = new FileReader()
            reader.onload = e => {
                const previewImage = document.getElementById("preview-image")
                previewImage.src = e.target.result
            }
            reader.readAsDataURL(input.files[0])
        }
    }

    const inputImage = document.getElementById("input_image")
    inputImage.addEventListener("change", e => {
        readImage(e.target)
    })

    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl)
    })
</script>

<script>
    function uploadfile1() {
        var form = new FormData();
        form.append("file1", $("#input_image")[0].files[0]);
        form.append("challengeCode", "${challengeDto.challengeCode}");
        form.append("challengePoint", "${challengeDto.challengeRewardAmount}");

        $.ajax({
            type: 'post',
            url: '${ path }/challenges/uploadfile',
            dataType: "text",
            data: form,
            processData: false,
            contentType: false,
            cache: false,
            success: function (result) {
                if (result == "성공") {
                    console.log(result);
                    // alert('성공');
                    $('#markModalClose').trigger('click')
                    $('#complete').trigger('click')
                } else {
                    $('#markModalClose').trigger('click')
                    $('#fail').trigger('click')
                }
            },
            error: function (result) {
                console.log(result);
                alert('실패');
            }
        })
    }
</script>

<script src="${ common }/assets/js/kakao.js"></script>
<script>
    let kakaoAppKey = "<c:out value='${kakaoAppKey}' />";
    Kakao.init(kakaoAppKey);
    Kakao.isInitialized();

    Kakao.Share.createCustomButton({
        container: '#kakaotalk-sharing-btn',
        templateId: 99056,
        templateArgs: {
            key: '${challengeDto.challengeCode}',
            title: '${challengeDto.challengeName}',
            description: '${challengeDto.challengeInfoSummary}'
        }
    });
</script>

</body>

</html>