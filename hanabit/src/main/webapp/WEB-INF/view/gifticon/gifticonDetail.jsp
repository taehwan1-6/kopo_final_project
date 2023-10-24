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
    <style>
        .page-title-box {
            /*background-image: url(../images/home/page-title.png);*/
            background-size: cover;
            background-color: #b4a7ee;
            position: relative;
            padding-top: 225px;
            padding-bottom: 110px;
            background-position: center;
        }

        a {
            color: black;
        }
    </style>

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

                <!-- Start home -->
                <section class="page-title-box">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-6">
                                <div class="text-center text-white">
                                    <h3 class="mb-4">기프티콘 선물하기</h3>
                                    <div class="page-next">
                                        <nav class="d-inline-block" aria-label="breadcrumb text-center">
                                            <ol class="breadcrumb justify-content-center">
                                                <li class="breadcrumb-item"><a href="${path}/">홈</a></li>
                                                <li class="breadcrumb-item active" aria-current="page"> 기프트샵 </li>
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
<%--                                        <form action="${path}/gifticon/gift" method="post">--%>
                                            <div>
                                                <input type="hidden" value="${gifticon.gifticonCode}" id="gifticonCode" />
                                                <img src="${path}/${gifticon.gifticonImgPath}/${gifticon.gifticonTitleImg}"
                                                     alt="" class="img-fluid"  style="object-fit: cover; width: 400px; height: 300px;%" >
                                                <div class="mt-3">
                                                    <span class="fs-13 mt-1 mb-2">${gifticon.gifticonBrand}</span>
                                                    <a href="${path}/gifticon/${gifticon.gifticonCode}" class="primary-link">
                                                        <h5 class="fs-28">${gifticon.gifticonName}</h5>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="candidate-education-details mt-4 pt-3">
                                                <h6 class="fs-17 fw-bold mb-0">설명</h6>
                                                <p class="text-muted mb-2">${gifticon.gifticonInfoContent}
                                            </div><!--end candidate-education-details-->
                                            <div class="candidate-education-details mt-4 pt-3">
                                                <h6 class="fs-17 fw-bold mb-0">가격</h6>
                                                <div class="fs-17" style="font-weight: bold"><fmt:formatNumber value="${gifticon.gifticonAmount}" pattern="###,###"/> 하나머니</div>
                                            </div><!--end candidate-education-details-->

                                            <div class="candidate-education-details mt-4 pt-3">
                                                <h6 class="fs-17 fw-bold mb-0">결제정보</h6>

                                                <div class="mt-4">
                                                    <div class="ms-4" role="tablist">
                                                        <h6 class="fs-16 mb-1">받는사람</h6>
                                                        <div class="row">
                                                            <input type="text" class="form-control col-3" placeholder="성함" style="width: 100px; margin-right: 10px"/>
                                                            <input type="text" class="form-control" id="phoneNumber"
                                                                   value="" name="phone" placeholder="'-'없이 입력" style="width: 300px" />
                                                        </div>

        <%--                                                    <button class="btn btn-soft-primary">나에게 선물하기</button>--%>
        <%--                                                    <button class="btn btn-soft-secondary"><i class="uil uil-gift"></i> 선물하기</button>--%>
                                                    </div>
                                                </div>
                                                <div class="mt-4">
                                                    <div class="ms-4">
                                                        <h6 class="fs-16 mb-1">수량</h6>
                                                        <p class="mb-2 text-muted">최대 5개 구매가능</p>
                                                        <div class="row">
                                                        <input id="amountCount" class="form-control col-6" type="number" placeholder="구매할 수량을 입력해주세요." min="1" max="5" style="width: 300px"/>
                                                        <span class="col-1" style="padding-top: 10px"> 개</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="text-end">
<%--                                                <button type="submit" id="sendGifticon" class="btn btn-primary btn-hover"><i class="uil uil-gift"></i> 결제하기</button>--%>
                                                    <button type="button" id="sendGifticon" class="btn btn-primary btn-hover"><i class="uil uil-gift"></i> 결제하기</button>
                                            </div>
<%--                                        </form>--%>
                                    </div><!--end card-body-->
                                </div><!--end card-->
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end container-->
                </section>
                <!-- END CANDIDATE-DETAILS -->




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
        // 인증번호 보내기
        $('#sendGifticon').on('click', function authMessage() {

            // 인증번호 창 켜지기
            // $('#phoneAuthSection').show()

            // coolsms로 메시지 보내지기
            let telnum = document.getElementById('phoneNumber').value;
            let gifticonCode = document.getElementById('gifticonCode').value;
            let amountCount = document.getElementById('amountCount').value;// 수량

            console.log(telnum, gifticonCode, amountCount);


            let json = {
                'tel': telnum.toString(),
                'gifticonCode': gifticonCode.toString(),
                'amountCount': amountCount.toString()
            }

            $.ajax({

                url: '${ path }/gifticon/sms',
                method: 'post',
                data: JSON.stringify(json),
                contentType: "application/json",
                success: function () {
                    console.log('성공');
                    Swal.fire({
                        title: "기프티콘 전송이 완료되었습니다",
                        text: "기프티콘 전송이 완료되었습니다",
                        icon: "success",
                    })
                },
                error: function () {
                    alert('실패');
                    Swal.fire({
                        title: "기프티콘 전송이 실패하였습니다",
                        text: "다시 입력해주세요",
                        icon: "error",
                    });
                },
            })
        })
    </script>


</body>

</html>