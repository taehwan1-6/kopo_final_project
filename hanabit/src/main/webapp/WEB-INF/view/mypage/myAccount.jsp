<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="kr.ac.kopo.hanabit.util.LocalDateTimeToDate" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="hyper" value="${pageContext.request.contextPath}/hyper"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/view/include/head.jsp" %>
    <%@include file="/WEB-INF/view/geeks/head.jsp" %>


    <style>
        .pagination .page-item .page-link {
            border-radius: 40px;
            height: 20px;
            width: 10px;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            margin: 0 4px;
        }

        div.dataTables_wrapper div.dataTables_length select {
            width: 70%;
            display: inline-block;
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


            <!-- 회원 프로필 정보 -->
            <div class="mt-15 pt-5 pb-5">
                <div class="container">
                    <%@include file="/WEB-INF/view/mypage/profileTop.jsp" %>

                    <!-- Content -->

                    <div class="row mt-0 mt-md-4">
                        <div class="col-lg-3 col-md-4 col-12">
                            <!-- Side navbar -->
                            <%@include file="/WEB-INF/view/mypage/myAccountSidebar.jsp" %>
                        </div>

                        <c:if test="${empty accounts}">
                            <div class="col-lg-9 col-md-8 col-12">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <div class="text-center">
                                            <h3>존재하는 계좌가 없습니다.</h3>
                                            <h1 class="fw-bold mb-0">계좌개설 하러가기</h1>
                                            <div class="mt-3">
                                                원큐하나빗 서비스를 이용하기 위해서는 하나은행 계좌를 개설하셔야 합니다.
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row mt-2 text-center">
                                            <div class="col-12">
                                                <a href="${path}/account/create-link" type="button"
                                                   class="col-6 btn btn-soft-primary">개설하기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${not empty accounts}">
                        <div class="col-lg-9 col-md-8 col-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- Side Navbar -->
                                    <ul class="nav nav-lb-tab mb-2" id="tab" role="tablist">
                                        <li class="nav-item ms-0" role="presentation">
                                            <a class="nav-link active " id="bookmarked-tab" data-bs-toggle="pill"
                                               href="#bookmarked" role="tab"
                                               aria-controls="bookmarked" aria-selected="true">입출금이 자유로운 예금 </a>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link" id="currentlyLearning-tab" data-bs-toggle="pill"
                                               href="#currentlyLearning" role="tab"
                                               aria-controls="currentlyLearning" aria-selected="false">정기예금</a>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link" id="path-tab" data-bs-toggle="pill" href="#path"
                                               role="tab" aria-controls="path"
                                               aria-selected="false">
                                                적금</a>
                                        </li>
                                    </ul>
                                    <!-- Tab content -->
                                    <div class="tab-content" id="tabContent">
                                        <c:forEach items="${cAccounts}" var="account">
                                            <div class="tab-pane fade show active" id="bookmarked" role="tabpanel"
                                                 aria-labelledby="bookmarked-tab">
                                                <div class="row">
                                                    <div class="row text-center">
                                                        <div class="job-box bookmark-post card mt-2">
                                                            <div class="p-4">
                                                                <div class="row">
                                                                    <div class="col-lg-2">
                                                                        <img src="${common}/assets/images/logo/hanabank.png"
                                                                             width="50%" alt=""
                                                                             class="img-fluid rounded-3"></a>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="mt-3 mt-lg-0">
                                                                            <a href="javascript:void(0)"
                                                                               class="text-dark account-link"
                                                                               data-accountNum="${account.accountNum}">
                                                                                <h5>${account.accountNum}</h5>
                                                                            </a>
                                                                            <ul class="list-inline mb-0">
                                                                                <li class="list-inline-item">
                                                                                    <p class="text-muted fs-14 mb-0">${account.productName}</p>
                                                                                </li>
                                                                                <li class="list-inline-item">
                                                                                    <p class="text-muted fs-14 mb-0">
                                                                                        | ${account.type}</p>
                                                                                </li>
                                                                                <li class="list-inline-item">
                                                                                    <p class="text-muted fs-14 mb-0">|
                                                                                        <fmt:formatNumber
                                                                                                value="${account.balance}"
                                                                                                pattern="###,###"/>원</p>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div><!--end col-->
                                                                    <button class="col-2 btn btn-soft-success"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#transferFreeModal">계좌이체
                                                                    </button>
                                                                    <button class="col-2 btn btn-soft-primary"
                                                                            onclick="location.href='${path}/account/${account.accountNum}'">
                                                                        조회하기
                                                                    </button>
                                                                </div><!--end row-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:forEach>


                                        <div class="tab-pane fade" id="currentlyLearning" role="tabpanel"
                                             aria-labelledby="currentlyLearning-tab">
                                            <div class="row">


                                                <div class="row text-center">
                                                    <c:forEach items="${tdAccounts}" var="account">
                                                        <div class="job-box bookmark-post card mt-2">
                                                            <div class="p-4">
                                                                <div class="row">
                                                                    <div class="col-lg-2">
                                                                        <img src="${common}/assets/images/logo/hanabank.png"
                                                                             width="50%" alt=""
                                                                             class="img-fluid rounded-3"></a>
                                                                    </div>
                                                                    <div class="col-lg-6">
                                                                        <div class="mt-3 mt-lg-0">
                                                                            <a href="javascript:void(0)"
                                                                               class="text-dark account-link"
                                                                               data-bs-toggle="modal"
                                                                               data-bs-target="#productModal"
                                                                               data-accountNum="${account.accountNum}">
                                                                                <h5>${account.accountNum}</h5>
                                                                            </a>
                                                                            <ul class="list-inline mb-0">
                                                                                <li class="list-inline-item">
                                                                                    <p class="text-muted fs-14 mb-0">${account.productName}</p>
                                                                                </li>
                                                                                <li class="list-inline-item">
                                                                                    <p class="text-muted fs-14 mb-0">
                                                                                        | ${account.type}</p>
                                                                                </li>
                                                                                <li class="list-inline-item">
                                                                                    <p class="text-muted fs-14 mb-0">|
                                                                                        <fmt:formatNumber
                                                                                                value="${account.balance}"
                                                                                                pattern="###,###"/>원</p>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div><!--end col-->
                                                                    <button class="col-2 btn btn-soft-success"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#transferFreeModal">계좌이체
                                                                    </button>
                                                                    <button class="col-2 btn btn-soft-primary"
                                                                            onclick="location.href='${path}/account/${account.accountNum}'">
                                                                        조회하기
                                                                    </button>
                                                                </div><!--end row-->
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>

                                            </div>

                                        </div>
                                        <!-- Path -->
                                        <div class="tab-pane fade" id="path" role="tabpanel" aria-labelledby="path-tab">
                                            <div class="row  d-flex justify-content-center text-center">
                                                <div class="col-xl-5 col-lg-5 col-md-12 col-12">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card -->


                            <!-- Card -->
                            <div class="card mt-5 mb-4">
                                <!-- Card header -->
                                <div class="card-header">
                                    <h3 class="mb-0">거래내역</h3>
                                </div>


                                <div class="p-5">
                                    <table id="transactionLogsTable" style="font-size: 80%">
                                        <thead>
                                        <tr>
                                            <th>일시</th>
                                            <th>거래명</th>
                                            <th>금액</th>
                                            <th>잔액</th>
                                            <th>거래계좌</th>
                                            <!-- ... 기타 칼럼들 ... -->
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${allTransaction}" var="transaction">
                                            <tr>
                                                <td>
                                                        ${transaction.transactionDate}
                                                </td>


                                                <td>${transaction.transactionName}</td>
                                                <c:if test="${transaction.transactionType eq '출금'}">
                                                    <td class="text-danger">-<fmt:formatNumber
                                                            value="${transaction.transactionAmount}" pattern="###,###"/>원
                                                    </td>
                                                </c:if>
                                                <c:if test="${transaction.transactionType eq '입금'}">
                                                    <td class="text-success">+<fmt:formatNumber
                                                            value="${transaction.transactionAmount}" pattern="###,###"/>원
                                                    </td>
                                                </c:if>

                                                <td><fmt:formatNumber value="${transaction.transactionBalance}"
                                                                      pattern="###,###"/>원
                                                </td>

                                                <td>${transaction.targetBankCode} | ${transaction.targetAccountNum}</td>


                                                <!-- ... 기타 데이터 칼럼들 ... -->
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            </c:if>


        </div>
        <!-- End Page-content -->


    </div>
    <!-- end main content-->

</div>
<!-- END layout-wrapper -->
<!-- START FOOTER -->
<%@include file="/WEB-INF/view/include/footer.jsp" %>
<!-- END FOOTER -->


<!-- JAVASCRIPT -->
<%@include file="/WEB-INF/view/geeks/includeJS.jsp" %>

<!-- 거래내역 -->
<script>
    $(document).ready(function () {
        $('#transactionLogsTable').DataTable({
            "pageLength": 10,
            "language": {
                "lengthMenu": "_MENU_ 항목 표시",
                "zeroRecords": "데이터가 없습니다",
                "info": "_START_에서 _END_까지 _TOTAL_개의 항목 표시",
                "infoEmpty": "0개의 항목 표시",
                "infoFiltered": "(전체 _MAX_ 항목 중 필터링됨)",
                "search": "검색:",
                "paginate": {
                    "first": "첫 페이지",
                    "last": "마지막 페이지",
                    "next": "다음",
                    "previous": "이전"
                },
                "loadingRecords": "로딩 중...",
                "processing": "처리 중...",
                "emptyTable": "테이블에 데이터가 없습니다"
            },
            "order": [[0, 'desc']]
        });
    });
</script>


</body>

</html>