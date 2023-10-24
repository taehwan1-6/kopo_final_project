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
                                <h3 class="mb-4" style="color: black">상품가입 약관</h3>
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
            <!-- START FAQ-PAGE -->
            <section class="section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <ul class="faq-menu nav nav-fill nav-pills justify-content-center" id="pills-tab"
                                role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="general-tab" data-bs-toggle="pill"
                                            data-bs-target="#generalTab" type="button" role="tab"
                                            aria-controls="generalTab"
                                            aria-selected="true"><i id="checkIcon1" class="fa-solid fa-circle-check"
                                                                    style="margin-right: 3px; color: red;"></i>예금거래 기본약관
                                    </button>

                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="buying-tab" data-bs-toggle="pill"
                                            data-bs-target="#buyingTab" type="button" role="tab" aria-controls="buying"
                                            aria-selected="false"><i id="checkIcon2" class="fa-solid fa-circle-check"
                                                                     style="margin-right: 3px; color: red;"></i>거치식 예금약관
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="payment-tab" data-bs-toggle="pill"
                                            data-bs-target="#paymentTab" type="button" role="tab"
                                            aria-controls="payment"
                                            aria-selected="false"><i id="checkIcon3" class="fa-solid fa-circle-check"
                                                                     style="margin-right: 3px; color: red;"></i>비과세종합저축
                                        특약
                                    </button>
                                </li>
                            </ul>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->
                    <div class="row align-items-center mt-5">
                        <div class="col-lg-12">
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="generalTab" role="tabpanel"
                                     aria-labelledby="general-tab">
                                    <div class="row">
													<textarea class="form-control" readonly="readonly"
                                                              style="height: 400px;">
이 예금거래기본약관(이하 “약관”이라 합니다)은 (주)원큐하나빗(이하 “은행”이라 합니다)와 거래처(또는 예금주)가 서로 믿음을 바탕으로 예금거래를 빠르고 틀림없이 처리하는 한편, 서로의 이해관계를 합리적으로 조정하기 위하여 기본적이고 일반적인 사항을 정한 것입니다. 은행은 이 약관을 원큐하나빗 홈페이지 및 원큐하나빗 앱에 게시하고, 거래처는 영업시간 중 언제든지 이 약관을 볼 수 있고 또한 그 교부를 청구할 수 있습니다.


제1조 적용범위
이 약관은 입출금이자유로운예금, 거치식예금 및 적립식예금 거래에 적용합니다.


제2조 실명거래
① 거래처는 실명으로 거래하여야 합니다.
② 은행은 거래처의 실명확인을 위하여 주민등록증·사업자등록증명원 등 실명확인증표 또는 그 밖에 필요한 서류의 제시나 제출을 요구할 수 있고, 거래처는 이에 따라야 합니다.


제3조 가입자격
① 거래처는 만 17세 이상의 국민인 거주자 또는 법인이어야 합니다.
② 아래 각 호의 어느 하나에 해당하는 자는 예금계약의 상대방이 될 수 없습니다.
- 비거주자
- 외국인
- 재외동포
- 제한능력자(만 17세 미만의 미성년자, 피성년후견인, 피한정후견인)
- 피특정후견인


제4조 거래장소와 거래방법
거래처는 원큐하나빗 홈페이지 및 원큐하나빗 앱을 통하여 모든 예금거래를 합니다. 다만, 은행이 정하는 바에 따라다른 금융기관 또는 현금 자동출금기, 현금 자동입출금기, 당행의 업무지원센터(상속, 질권설정 등 일부 제한된 업무)를 통하여 거래할 수 있습니다.


제5조 비밀번호 등의 신고
거래처는 거래를 시작할 때 원큐하나빗 홈페이지 및 원큐하나빗 앱을 이용하여 비밀번호, 성명, 상호, 대표자명, 주소등 거래에 필요한 사항을 신고하여야 합니다.


제6조 입금
① 거래처는 현금이나 자기앞수표로 입금할 수 있습니다.
② 거래처는 현금이나 자기앞수표로 계좌송금(거래처가 다른 금융기관에서 거래처 계좌에 입금하는 것)하거나,계좌이체 할 수 있습니다.

													</textarea>
                                        <div style="display: flex; justify-content: center; margin-top: 10px;">
                                            <div class="form-check mb-2 justify-content-center">
                                                <input class="form-check-input" type="checkbox" value="" id="check1"/>
                                                <label class="form-check-label ms-2" for="check1">예금거래 기본약관에 대하여
                                                    동의합니다.</label>
                                            </div>
                                        </div>
                                    </div><!--end row-->
                                </div><!--end general-tab-->

                                <div class="tab-pane fade" id="buyingTab" role="tabpanel" aria-labelledby="buying-tab">
                                    <div class="row">
												<textarea class="form-control" readonly="readonly"
                                                          style="height: 400px;">
본 약관은 법령 및 내부통제기준에 따른 절차를 거쳐 제공됩니다.


제1조 적용범위
① 거치식예금(이하 "이 예금"이라 한다)이란 예치기간을 정하고 거래를 시작할 때 맡긴 돈을 만기에 찾는 예금을 말합니다.
② 이 약관에서 정하지 아니한 사항은 예금거래기본약관의 규정을 적용합니다.


                                                    
제2조 지급시기
이 예금은 약정한 만기일 이후 거래처가 청구할 때 지급합니다. 다만, 거래처가 부득이한 사정으로 청구할 때는 만기 전이라도 지급할 수 있습니다/



제3조 이자
① 이 예금의 이자는 약정한 예치기간에 따라 예금일 당시 원큐하나빗 홈페이지 및 원큐하나빗 앱에 게시한 예치기간별 이율로 셈하여 만기일 이후 원금과 함께 지급한다. 그러나 거래처의 요청이 있으면 월별로 이자를 지급할 수 있습니다.
② 만기일 후 지급 청구할 때는 만기일부터 지급일 전날까지의 기간에 대해 예금일 당시 원큐하나빗 홈페이지 및 원큐하나빗 앱에 게시한 만기후이율로 셈한 이자를 더하여 지급합니다..
③ 만기일 전에 지급 청구할 때는 예금일 부터 지급일 전날까지의 기간에 대하여 예금일 당시 원큐하나빗 홈페이지 및 원큐하나빗 앱에 게시한 중도해지이율로 셈하여 지급하며, 이미 지급한 이자는 지급할 금액에서 뺍니다.
④ 이 예금 중 변동금리를 적용하는 예금은 이율을 바꾼 때 바꾼 날부터 바꾼 이율로 셈하여 이자를 지급합니다.

												</textarea>
                                        <div style="display: flex; justify-content: center; margin-top: 10px;">
                                            <div class="form-check mb-2 justify-content-center">
                                                <input class="form-check-input" type="checkbox" value="" id="check2"/>
                                                <label class="form-check-label ms-2" for="check2">거치식 예금약관에 대하여
                                                    동의합니다.</label>
                                            </div>
                                        </div>
                                    </div><!--end row-->
                                </div><!--end buying-tab-->
                                <div class="tab-pane fade" id="paymentTab" role="tabpanel"
                                     aria-labelledby="payment-tab">
                                    <div class="row">
                        							<textarea class="form-control" readonly="readonly"
                                                              style="height: 400px;">
본 약관은 법령 및 내부통제기준에 따른 절차를 거쳐 제공됩니다.

이 예금거래기본약관(이하 “약관”이라 합니다)은 (주)원큐하나빗(이하 “은행”이라 합니다)와 거래처(또는 예금주)가 서로 믿음을 바탕으로 예금거래를 빠르고 틀림없이 처리하는 한편, 서로의 이해관계를 합리적으로 조정하기 위하여 기본적이고 일반적인 사항을 정한 것입니다. 은행은 이 약관을 원큐하나빗 홈페이지 및 원큐하나빗 앱에 게시하고, 거래처는 영업시간 중 언제든지 이 약관을 볼 수 있고 또한 그 교부를 청구할 수 있습니다.


제1조 적용범위
이 약관은 입출금이자유로운예금, 거치식예금 및 적립식예금 거래에 적용합니다.


제2조 실명거래
① 거래처는 실명으로 거래하여야 합니다.
② 은행은 거래처의 실명확인을 위하여 주민등록증·사업자등록증명원 등 실명확인증표 또는 그 밖에 필요한 서류의 제시나 제출을 요구할 수 있고, 거래처는 이에 따라야 합니다.


제3조 가입자격
③ 거래처는 만 17세 이상의 국민인 거주자 또는 법인이어야 합니다.
④ 아래 각 호의 어느 하나에 해당하는 자는 예금계약의 상대방이 될 수 없습니다.
1. 비거주자
2. 외국인
3. 재외동포
4. 제한능력자(만 17세 미만의 미성년자, 피성년후견인, 피한정후견인)
5. 피특정후견인


제4조 거래장소와 거래방법
거래처는 원큐하나빗 홈페이지 및 원큐하나빗 앱을 통하여 모든 예금거래를 합니다. 다만, 은행이 정하는 바에 따라 다른 금융기관 또는 현금 자동출금기, 현금 자동입출금기, 당행의 업무지원센터(상속, 질권설정 등 일부 제한된 업무)를 통하여 거래할 수 있습니다.
                                                        
                                                        
제5조 비밀번호 등의 신고
거래처는 거래를 시작할 때 원큐하나빗 홈페이지 및 원큐하나빗 앱을 이용하여 비밀번호, 성명, 상호, 대표자명, 주소 등 거래에 필요한 사항을 신고하여야 합니다.
                                                        
                                                        
제6조 입금
⑤ 거래처는 현금이나 자기앞수표로 입금할 수 있습니다.
⑥ 거래처는 현금이나 자기앞수표로 계좌송금(거래처가 다른 금융기관에서 거래처 계좌에 입금하는 것)하거나, 계좌이체 할 수 있습니다.

제7조 예금이 되는 시기
⑦ 제6조에 따라 입금한 경우 다음 각 호의 시기에 예금이 됩니다.
6. 현금 자동입출금기 등을 통하여 현금으로 입금한 경우 : 예금원장에 입금의 기록이 된 때
7. 현금으로 계좌송금하거나 계좌이체한 경우 : 예금원장에 입금의 기록이 된 때
8. 자기앞수표로 입금하거나 계좌송금한 경우 : 예금원장에 입금의 기록이 된 때. 단, 자기앞수표는 지급제시기간 안에 사고신고가 없으며 결제될 것이 틀림없음을 은행이 확인하였을 경우에 한함
⑧ 은행은 특별한 사정이 없는 한 제1항의 확인 또는 기록처리를 신속히 하여야 합니다.
                                                        
                        							</textarea>
                                        <div style="display: flex; justify-content: center; margin-top: 10px;">
                                            <div class="form-check mb-2 justify-content-center">
                                                <input class="form-check-input" type="checkbox" value="" id="check3"/>
                                                <label class="form-check-label ms-2" for="check3">비과세종합저축 약관에 대하여
                                                    동의합니다.</label>
                                            </div>
                                        </div>
                                    </div><!--end row-->
                                </div><!--end payment-tab-->
                                <div class="tab-pane fade" id="supportTab" role="tabpanel"
                                     aria-labelledby="support-tab">
                                    <div class="row">
													<textarea class="form-control" readonly="readonly"
                                                              style="height: 400px;">
본 약관은 법령 및 내부통제기준에 따른 절차를 거쳐 제공됩니다.
													</textarea>
                                    </div><!--end row-->
                                </div><!--end support-tab-->
                            </div>
                        </div><!--end col-->
                        <div class="col-lg-12">
                            <div class="text-center mt-5">
                                <button id="next" type="button" class="btn btn-warning btn-hover mt-2 ms-md-2"><i
                                        class="fa-solid fa-angles-right"></i> 다음으로 이동
                                </button>
                            </div>
                        </div>
                    </div><!--end row-->
                </div><!--end container-->
            </section>
            <!-- END FAQ-PAGE -->


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
    $(document).ready(function () {
        let ck1 = '0'
        let ck2 = '0'
        let ck3 = '0'
        $('#check1').on('click', function () {
            if ($(this).prop('checked')) {
                $("#checkIcon1").css("color", "green");
                ck1 = '1'
            } else {
                $("#checkIcon1").css("color", "red");
                ck1 = '0'
            }
        })
        $('#check2').on('click', function () {
            if ($(this).prop('checked')) {
                $("#checkIcon2").css("color", "green");
                ck2 = '1'
            } else {
                $("#checkIcon2").css("color", "red");
                ck2 = '0'
            }
        })
        $('#check3').on('click', function () {
            if ($(this).prop('checked')) {
                $("#checkIcon3").css("color", "green");
                ck3 = '1'
            } else {
                $("#checkIcon3").css("color", "red");
                ck3 = '0'
            }
        })


        $('#next').on('click', function () {
            if (ck1 == '0') {
                Swal.fire({
                    title: "예금거래 기본약관에 동의해주세요.",
                    icon: "error",
                });
                return false;
            }
            if (ck2 == '0') {
                Swal.fire({
                    title: "거치식 예금약관 동의해주세요.",
                    icon: "error",
                });
                return false;
            }
            if (ck3 == '0') {
                Swal.fire({
                    title: "비과세종합처축 특약에 동의해주세요.",
                    icon: "error",
                });
                return false;
            }
            if (ck1 == '1' && ck2 == '1' && ck3 == '1') {
                location.href = '${path}/product/registry';
            }
        })

    })


</script>


</body>

</html>