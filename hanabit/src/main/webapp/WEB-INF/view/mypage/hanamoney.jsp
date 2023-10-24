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

        /*div.dataTables_wrapper div.dataTables_filter input {*/
        /*    margin-left: 0.5em;*/
        /*    display: inline-block;*/
        /*    height: 30%;*/
        /*    width: 80%;*/
        /*}*/
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
                            <%@include file="/WEB-INF/view/mypage/hanamoneySidebar.jsp" %>
                        </div>

                        <c:if test="${empty hanamoney}">
                            <div class="col-lg-9 col-md-8 col-12">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <div class="text-center">
                                            <h4><img style="margin-right: 0.25rem"
                                                     src="${common}/assets/images/logo/hanamoney.png" width="7%"/></h4>
                                            <h3>쓸수록 쌓이는 행복한 생활머니</h3>
                                            <h1 class="fw-bold mb-0">하나머니</h1>
                                            <div class="mt-3">
                                                하나머니를 이용하시려면 하나머니 이용을 신청해야합니다.
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row mt-2 text-center">
                                            <div class="col-12">
                                                <a href="${path}/hanamoney/intro" type="button"
                                                   class="col-6 btn btn-soft-primary">이용해보기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${not empty hanamoney}">
                        <div class="col-lg-9 col-md-8 col-12">
                            <!-- Card -->
                            <div class="card mb-4">
                                <!-- Card body -->
                                <div class="card-body">
                                    <div class="text-center">
                                        <h4><img style="margin-right: 0.25rem"
                                                 src="${common}/assets/images/logo/hanamoney.png" width="3%"/>하나머니</h4>
                                            <%--                                            <h1 class="fw-bold mb-0">1,519원</h1>--%>
                                        <h2 class="fw-bold mb-0">
                                            <fmt:formatNumber value="${hanamoney.balance}" pattern="###,###"/>원
                                        </h2>
<%--                                        <p class="mb-0">--%>
<%--                                            현금화가능 머니 <fmt:formatNumber value="${hanamoney.balance}" pattern="###,###"/>원--%>
<%--                                        </p>--%>
                                        <c:if test="${ not empty hanamoney.linkedAccountNum}">
                                            <p class="mb-0">
                                                연결계좌 <a href="#">하나은행<br>${hanamoney.linkedAccountNum}</a>
                                                     | <fmt:formatNumber value="${linkedAccount.balance}" pattern="###,###"/>원
                                            </p>
                                        </c:if>

                                    </div>
                                    <hr>
                                    <div class="row mt-2 text-center">
                                        <div class="col-4">
                                            <c:if test="${ empty hanamoney.linkedAccountNum}">
                                                <button class="col-12 btn btn-soft-primary"
                                                        data-bs-toggle="modal" data-bs-target="#linkedAccountModal">계좌연동
                                                </button>
                                            </c:if>
                                            <c:if test="${ not empty hanamoney.linkedAccountNum}">
                                                <button class="col-12 btn btn-soft-primary"
                                                        data-bs-toggle="modal" data-bs-target="#chargeModal">충전
                                                </button>
                                            </c:if>
                                        </div>
                                        <div class="col-4">
                                            <button class="col-12 btn btn-soft-primary">결제</button>
                                        </div>
                                        <div class="col-4">
                                            <button class="col-12 btn btn-soft-success"
                                                    data-bs-toggle="modal" data-bs-target="#transferFreeModal">무료송금
                                                    </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card -->
                            <div class="card mb-4">
                                <!-- Card header -->
                                <div class="card-header">
                                    <h3 class="mb-0">거래내역</h3>
                                </div>


                                <div class="p-5">
                                    <table id="transactionLogsTable">
                                        <thead>
                                        <tr>
                                            <th>일시</th>
                                            <th>거래명</th>
                                            <th>카테고리</th>
                                            <th>금액</th>
                                            <th>잔액</th>
                                            <th>송금처</th>
                                            <!-- ... 기타 칼럼들 ... -->
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${hanamoneyTransactionLogDtos}"
                                                   var="hanamoneyTransactionLogDto">
                                            <tr>
                                                <td><fmt:formatDate
                                                        value="${LocalDateTimeToDate.convertToDateViaInstant(hanamoneyTransactionLogDto.transDate)}"
                                                        pattern="MM월dd일 HH:mm"/></td>
                                                <td>${hanamoneyTransactionLogDto.transName}</td>
                                                <td>${hanamoneyTransactionLogDto.transCategory}</td>
                                                <c:if test="${hanamoneyTransactionLogDto.transType eq '출금'}">
                                                    <td class="text-danger">-<fmt:formatNumber value="${hanamoneyTransactionLogDto.transAmount}" pattern="###,###"/>원</td>
                                                </c:if>
                                                <c:if test="${hanamoneyTransactionLogDto.transType eq '입금'}">
                                                    <td class="text-success">+<fmt:formatNumber value="${hanamoneyTransactionLogDto.transAmount}" pattern="###,###"/>원</td>
                                                </c:if>
                                                <td><fmt:formatNumber value="${hanamoneyTransactionLogDto.transBalance}" pattern="###,###"/>원</td>
                                                <c:if test="${hanamoneyTransactionLogDto.transType eq '출금'}">
                                                    <td>${hanamoneyTransactionLogDto.targetBankCode} ${hanamoneyTransactionLogDto.targetAccountNum}</td>
                                                </c:if>
                                                <c:if test="${hanamoneyTransactionLogDto.transType eq '입금'}">
                                                    <td></td>
                                                </c:if>

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


<!-- Modal -->
<%@include file="/WEB-INF/view/hanamoney/chargeModal.jsp" %>
<%@include file="/WEB-INF/view/hanamoney/linkedAccountModal.jsp" %>
<%@include file="/WEB-INF/view/hanamoney/transferFreeModal.jsp" %>


<!-- JAVASCRIPT -->
<%@include file="/WEB-INF/view/geeks/includeJS.jsp" %>


<!-- 거래내역 -->
<script>
    $(document).ready(function() {
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