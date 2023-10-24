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
        :root {
            --bs-link-color: #000;
        }

        .btn-info {
            --bs-btn-color: #ffffff;
            --bs-btn-bg: #7a60f266;
            --bs-btn-border-color: #7a60f266;
        }
    </style>
</head>

<body>

<!-- ======= Header ======= -->
<%@include file="/WEB-INF/view/include/navbar.jsp" %>
<!-- End Header -->


<!-- ======= Submit Section ======= -->
<section id="submitForm" class="submitForm">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="container">
                    <div class="text-center mx-auto mb-5 wow fadeInUp"
                         data-wow-delay="0.1s" style="max-width: 600px; margin-top: 30%">
                        <h2 class="mb-4">약관 동의</h2>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="row g-4">
                                <div class="col-md-12 col-lg-12 wow fadeInUp" data-wow-delay="0.1s">
                                    <div class="service-item rounded overflow-hidden">
                                        <div class="row">
                                            <div class="col-lg-5 mt-5 mb-5" style="text-align: right;">
                                                <img alt=""
                                                     style="width: 90%; height: 90%;"
                                                     src="${common}/assets/images/logo/hanamoney.png ">
                                            </div>
                                            <div class="col-lg-7 mt-5 mb-5">
                                                <div class="position-relative p-4 " style="color: black;">
                                                    이 약관은 ㈜원큐하나빗, ㈜원큐하나빗와 서비스 공급계약이 체결된 업체(이하 “회사”)가 운영하는 인터넷 사이트,
                                                    모바일, 어플리케이션(이하 “플랫폼”)에서 제공하는 모든 플랫폼서비스(이하 "서비스")를 이용함에 있어 “회사”와
                                                    회원 간의 권리, 의무 및 책임사항에 관한 사항을 규정함을 목적으로 합니다. “회사”는 시스템에 관한 제반 기술과
                                                    운영에 대한 모든 권한을 갖고 있습니다.
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>


                                <div class="col-md mb-4 mb-md-0">
                                    <div class="accordion mt-3" id="accordionExample">
                                        <%--                                            <form action="#" method="" class="auth-form">--%>
                                        <div class="col-12 col-lg-12 card accordion-item p-0">
                                            <h2 class="accordion-header" id="headingOne">
                                                <button type="button" class="accordion-button collapsed"
                                                        data-bs-toggle="collapse" data-bs-target="#accordionOne"
                                                        aria-expanded="true" aria-controls="accordionOne">
                                                    <h6 class="policy_ttl">이용약관</h6></button>
                                            </h2>

                                            <div id="accordionOne" class="accordion-collapse collapse"
                                                 data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <div class="policy_cont_wrap">
                                                        <h6 class="policy_subttl mt30">제 1 조(하나머니 적립 및 충전)</h6>
                                                        <h6>
                                                            <ol class="policy_num_list mt10">
                                                                <li>① 회원은 회사와 멤버스 이용에 대한 계약을 체결한 제휴사 및 제휴 가맹점에서 하나머
                                                                    니를 적립할 수 있습니다. 하나머니의 적립 기준 및 적립 시점은 회사가 제휴사 및 제
                                                                    휴 가맹점과 약정하여 멤버스 홈페이지, 멤버스 App. 등을 통해 안내한 내용을 따르
                                                                    기로 합니다.
                                                                </li>
                                                                <li>
                                                                    ② 싞용/체크카드 등의 사용에 따른 하나머니의 적립 기준 및 적립 시점은 해당 카드 상
                                                                    품 약관에 따르며, 이에 대한 세부 내용은 멤버스 홈페이지, 하나카드 홈페이지, 멤버
                                                                    스 App. 등을 통해 안내 하기로 합니다.
                                                                </li>
                                                                <li>
                                                                    ③ 하나머니는 제13조의 방법에 의하여 캐시넛을 하나머니로 전환시킴으로서 충젂할 수
                                                                    있습니다.
                                                                </li>
                                                                <li>
                                                                    ④ 하나머니가 적립된 거래를 취소하는 경우 이미 적립된 하나머니 적립도 취소 되며, 만
                                                                    약 적립된 하나머니의 사용으로 인해 취소할 하나머니가 없을 경우 회원의 보유한 잔
                                                                    여 적립 및 충젂 하나머니에서 차감하거나, 향후 적립, 충전되는 하나머니에서 차감합
                                                                    니다.
                                                                </li>
                                                            </ol>
                                                        </h6>
                                                        <h6 class="policy_subttl mt30">제 2 조(하나머니 사용)</h6>
                                                        <h6>
                                                            <ol class="policy_num_list mt10">
                                                                <li>
                                                                    이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
                                                                    <ol class="policy_num_list">
                                                                        <li>① 사용 가능한 하나머니를 보유한 회원은 제휴사, 제휴 가맹점에 멤버스 카드를
                                                                            제시하
                                                                            는 등 회사가 정한 절차에 따라 상품 구매나 서비스 이용에 따른 대금의 일부
                                                                            또는
                                                                            젂부를 하나머니로 결제할 수 있습니다. 단, 일부 제휴사 등에서는 결제가 제한될
                                                                            수
                                                                            있으며, 세부 내용은 회사와 제휴사 등이 약정하여 멤버스 홈페이지, 멤버스
                                                                            App. 등
                                                                            을 통해 안내한 내용을 따르기로 합니다.
                                                                        </li>
                                                                        <li>② 하나머니 사용을 위한 최저 기준은 1 하나머니이며, 1 하나머니는 1원의
                                                                            가치를 가집
                                                                            니다.
                                                                        </li>
                                                                        <li>③ 회원은 하나머니를 타인에게 대여 또는 담보의 목적으로 이용할 수
                                                                            없습니다.
                                                                        </li>
                                                                        <li>④ 하나머니 사이에 남은 유효 기간이 다른 경우 유효 기간이 가장 먼저 도래하는
                                                                            하나
                                                                            머니가 먼저 사용됩니다.
                                                                        </li>
                                                                    </ol>
                                                                </li>
                                                            </ol>
                                                        </h6>
                                                        <h6 class="policy_subttl mt30">제 3 조 (하나카드 하나머니 및 KEB하나은행
                                                            YES포인트의 전환)</h6>
                                                        <h6>
                                                            <ol class="policy_num_list mt10">
                                                                ① 회원이 하나금융그룹 계열회사와의 거래(싞용카드 사용, KEB하나은행 거래 실적 등)로
                                                                적립 받아 보유하고 있던 하나카드 하나머니 및 KEB하나은행 YES포인트는 멤버스 가
                                                                입과 동시에 하나머니로 전환 되고, 이후 하나머니로 통합 관리 됩니다.
                                                                ② 제1항에 따라 전환된 하나머니는 전환 이전 부여된 유효기간이 그대로 유지되고, 멤
                                                                버스 이용 정지 또는 이용 계약 해지시 하나카드 하나머니 또는 KEB하나은행 YES포
                                                                인트로 복원되지 않습니다.
                                                                ③ 하나카드 하나머니의 자동 전환이나 사용에 대해 규정하는 상품 또는 서비스를 이용
                                                                하고 있는 경우, 해당 상품 또는 서비스 약관이 우선 적용 되며, 해당 상품 또는 서비
                                                                스는 멤버스 홈페이지, 하나카드 홈페이지, 멤버스 App. 등을 통해 안내한 내용을 따
                                                                르기로 합니다.
                                                            </ol>
                                                        </h6>
                                                        <h6 class="policy_subttl mt30">제 4 조 (하나금융 계열회사 외 제휴사 운영 포인트의 전환
                                                            또는 합산 사용)</h6>
                                                        <h6>
                                                            <ol class="policy_num_list mt10">
                                                                ① 회원은 하나머니와 하나금융그룹 계열 회사가 아닌 제휴사가 운영하는 포인트를 상호
                                                                전환 또는 합산하여 사용할 수 있습니다.
                                                                ② 제1항의 포인트 젂홖 및 합산 사용에 대한 세부적인 절차와 기준 등의 내용은 회사와
                                                                제휴사 등이 약정하여 멤버스 홈페이지, 멤버스 App. 등을 통해 안내한 내용을 따르
                                                                기로 합니다.
                                                            </ol>
                                                        </h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="text-align: right;">
                                            <h6 class="mt-4 mb-4">
                                                <input class="form-check-input" type="checkbox" value=""
                                                       id="checkAll"/> <label class="form-check-label me-3"
                                                                              for="checkAll"> 전체동의 </label>
                                            </h6>
                                        </div>

                                        <div class="col-12 col-lg-10 m-auto pt-3 pb-3">
                                            <input class="form-check-input" type="checkbox" value=""
                                                   id="check1yes"/><label
                                                class="form-check-label text-secondary me-3"
                                                for="check1yes">[필수] 만 18세 이상입니다.</label>
                                        </div>

                                        <div class="col-12 col-lg-10 m-auto pt-3 pb-3">
                                            <input class="form-check-input" type="checkbox" value=""
                                                   id="check2yes"/><label
                                                class="form-check-label text-secondary me-3" for="check2yes">[필수]
                                            이용 약관에 동의합니다.</label>
                                        </div>


                                        <div class="col-12 col-lg-10 m-auto pt-3 pb-3">
                                            <input class="form-check-input" type="checkbox" value=""
                                                   id="check3yes"/><label
                                                class="form-check-label text-secondary me-3" for="check3yes">
                                            [필수] 개인정보 수집 및 이용에 동의합니다.</label>
                                        </div>


                                        <%--                                                <div class="col-12 col-lg-10 m-auto pt-3 pb-3">--%>

                                        <%--                                                    <input class="form-check-input" type="checkbox" value=""--%>
                                        <%--                                                           id="checkEmail"/> <label--%>
                                        <%--                                                        class="form-check-label text-primary me-3" for="checkEmail">--%>
                                        <%--                                                    <h6 class="text-primary">약관 및 상품설명서 이메일로 받기</h6></label>--%>
                                        <%--                                                </div>--%>


                                        <div class="mt-5 mb-5" style="text-align: center;">
                                            <button class="col-6 btn btn-soft-primary"
                                                    data-bs-toggle="modal" data-bs-target="#easyPasswordModal">
                                                동의합니다
                                            </button>
                                            <%--                                                    <input type="submit" class="btn btn-primary" value="동의합니다"--%>
                                            <%--                                                           style="padding-left: 100px; padding-right: 100px;">--%>
                                        </div>
                                        <%--                                            </form>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- row -->

                        </div>
                    </div>

                </div>


            </div>
            <!-- End Submit Form -->
        </div>
    </div>
</section>
<!-- End Submit Section -->

</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<%@include file="/WEB-INF/view/include/footer.jsp" %>
<!-- End Footer -->

<!-- Modal -->
<%@include file="/WEB-INF/view/hanamoney/easyPasswordModal.jsp" %>

<script>
    // 전체동의 체크박스를 클릭할 때 다른 체크박스 상태를 변경하는 함수
    function toggleAllCheckboxes() {
        var checkAll = document.getElementById("checkAll");
        var checkboxes = document.querySelectorAll("input[type='checkbox']");

        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = checkAll.checked;
        }
    }

    // 전체동의 체크박스에 이벤트 리스너 추가
    var checkAll = document.getElementById("checkAll");
    checkAll.addEventListener("click", toggleAllCheckboxes);
</script>

</body>

</html>