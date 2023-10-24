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
                                <h3 class="mb-4" style="color: black">상품가입</h3>
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
            <section class="section" style="padding-top: 30px;">
                <div class="container">
                    <div class="row justify-content-center">
                        <form id="productForm" action="${path}/product/registry" method="post">
                            <input type="hidden" class="form-control" id="productCode" name="productCode"
                                   value="${product.productCode}">
                            <div>
                                <h5 class="fs-17 fw-semibold mb-3 mb-0">가입정보</h5>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="col-6 mb-5">
                                            <h6 for="productName" class="form-label">가입상품명</h6>
                                            <span>${product.productName}</span>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="col-6 mb-5">
                                            <h6 for="firstName" class="form-label">연결 입출금 계좌</h6>
                                            <select class="form-select"
                                                    id="linkAccountAlert"
                                                    aria-label="Default select example"
                                                    content="연동 계좌를 선택해주세요"
                                                    name="linkedAccountNum">
                                                <c:forEach items="${currentAccounts}" var="currentAccount">
                                                    <c:if test="${currentAccount.type eq '입출금' }">
                                                        <option value="${currentAccount.accountNum}">
                                                            [${currentAccount.bankCode}]
                                                            | ${currentAccount.accountNum }
                                                            | ${currentAccount.productName }
                                                            | 잔액: <fmt:formatNumber value="${currentAccount.balance}"
                                                                                    pattern="###,###"/>원
                                                        </option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="mb-5">
                                            <h6 for="registryAmount" class="form-label">가입금액(만원)</h6>
                                            <input type="number" class="form-control" id="registryAmount"
                                                   name="registryAmount"
                                                   placeholder="최소 <fmt:formatNumber value="${product.productMinAmount / 10000}" pattern="###,###"/>만원 ~ 최대 <fmt:formatNumber value="${product.productMaxAmount / 10000}" pattern="###,###"/>만원"/>
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div class="col-lg-6">
                                        <div class="mb-5">
                                            <h6 for="registryPeriod" class="form-label">가입기간(개월)</h6>
                                            <input type="number" class="form-control" id="registryPeriod"
                                                   name="registryPeriod"
                                                   placeholder="최소 <fmt:formatNumber value="${product.productMinPeriod}" pattern="###,###"/>개월 ~ 최대 <fmt:formatNumber value="${product.productMaxPeriod}" pattern="###,###"/>개월"/>
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <!--end col-->
                                    <div class="col-lg-6">
                                        <div class="mb-5">
                                            <h6 for="registryAccountPassword" class="form-label">가입상품 계좌 비밀번호</h6>
                                            <input type="password" class="form-control" id="registryAccountPassword"
                                                   name="registryAccountPassword"
                                                   placeholder="비밀번호 4자리를 입력해주세요"/>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="mb-5">
                                            <h6 for="registryAccountPassword2" class="form-label">비밀번호 재확인</h6>
                                            <input type="password" class="form-control" id="registryAccountPassword2"
                                                   name="registryAccountPassword2"
                                                   placeholder="비밀번호를 한번 더 입력해주세요"/>
                                        </div>
                                    </div>


                                </div>
                                <div style="display: flex; justify-content: center; margin-top: 10px;">
                                    <div class="form-check mb-2 justify-content-center">
                                        <input class="form-check-input" type="checkbox" value="" id="tos"/>
                                        <label class="form-check-label ms-2" for="tos">상품가입 이용약관 및 개인정보취급방침에
                                            동의합니다</label>
                                    </div>
                                </div>


                        </form>
                        <div class="mt-4 text-end">
                            <button id="next" type="button" class="btn btn-primary btn-hover mt-2 ms-md-2"
                                    disabled="disabled" onclick="next()">가입하기
                            </button>
                        </div>
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

<!-- JAVASCRIPT -->


</body>

<script>
    $(document).ready(function () {
        // 체크박스 클릭 이벤트
        $('#tos').on('change', function () {
            if ($(this).prop('checked')) {
                $('#next').removeAttr("disabled");
            } else {
                $('#next').attr("disabled", true);
            }
        });

        // "가입하기" 버튼 클릭 이벤트
        $('#next').on('click', function (e) {
            e.preventDefault(); // 기본 이벤트 방지
            Swal.fire({
                title: "상품가입에 성공하셨습니다.",
                icon: "success",
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#productForm').submit();
                }
            });
        });
    });
</script>

</html>