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

<!-- ======= Header ======= -->
<%@include file="/WEB-INF/view/include/navbar.jsp" %>
<!-- End Header -->


<!-- ======= Submit Section ======= -->
<section id="submitForm" class="submitForm" style="margin-top: 10%; margin-bottom: 10%">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 mt-5">


                <c:if test="${empty accounts}">
                    <div class="mt-5 mb-3 text-center">
                        <h3>보유하고 있는 하나은행 계좌가 없습니다.</h3>
                        <h6>하나은행 계좌가 없으신가요?</h6>
                    </div>
                    <div class="text-center">
                        <img style="width:50%" alt="은행계좌" src="${ common }/assets/images/gif/bank-account.gif">
                    </div>
                    <div class="mt-3 text-center">
                        <button class="btn btn-soft-primary" onclick="location.href='${path}/account/create/tos'">
                            계좌 개설하러 가기
                        </button>
                    </div>
                </c:if>

                <c:if test="${not empty accounts}">
                    <div class="mb-3 text-center">
                        <h3>연결할 하나은행 계좌를 선택해주세요</h3>
                    </div>
                    <hr style="color: black; height: 2px;">
                    <div class="row text-center">
                        <c:forEach items="${accounts}" var="account">
                            <div class="job-box bookmark-post card mt-4">
                                <div class="p-4">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <img src="${common}/assets/images/logo/hanabank.png" width="50%" alt=""
                                                 class="img-fluid rounded-3"></a>
                                        </div>
                                        <div class="col-lg-10">
                                            <div class="mt-3 mt-lg-0">
                                                <a href="javascript:void(0)" class="text-dark account-link"
                                                   data-accountNum="${account.accountNum}">
                                                    <h5>${account.accountNum}</h5>
                                                </a>
                                                <ul class="list-inline mb-0">
                                                    <li class="list-inline-item">
                                                        <p class="text-muted fs-14 mb-0">${account.productName}</p>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <p class="text-muted fs-14 mb-0">| ${account.type}</p>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <p class="text-muted fs-14 mb-0">| <fmt:formatNumber
                                                                value="${account.balance}" pattern="###,###"/>원</p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="text-center mt-5">
                        <button class="btn btn-soft-primary" onclick="location.href='${path}/'">
                            메인 화면으로
                        </button>
                    </div>
                </c:if>


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


<!-- START MODAL -->
<button id="success" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
    Launch static backdrop modal
</button>
<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="">
            <div class="modal-body">
                <div class="d-flex justify-content-center mb-1">
                    <h5 class="modal-title" id="staticBackdropLabelSuccess">계좌연동 성공!</h5>
                </div>
                <div class="w-100 d-flex flex-column align-items-center">
                    <img alt="" src="${common}/assets/images/gif/complete.gif" width="50%" height="50%">
                    <button class="btn btn-soft-primary" onclick="location.href='${path}/hanamoney'">하나머니로 돌아가기 <i
                            class="fa-solid fa-arrow-right"></i></button>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- END MODAL -->
<!-- START MODAL -->
<button id="fail" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
    Launch static backdrop modal
</button>
<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabelFail">실패</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                계좌 연동에 실패하셨습니다. 다시 연동해주세요.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="failClose">Close</button>
                <button type="button" class="btn btn-primary" onclick="remarkclick()">다시 연동하기</button>
            </div>
        </div>
    </div>
</div>
<!-- END MODAL -->
<!-- START MODAL -->
<button id="error" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
    Launch static backdrop modal
</button>
<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabelError">실패</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                서버 오류로 계좌 연동에 실패하셨습니다. 다시 연동해주세요.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="errorClose">Close</button>
                <button type="button" class="btn btn-primary" onclick="remarkclick()">다시 연동하기</button>
            </div>
        </div>
    </div>
</div>
<!-- END MODAL -->


<script>
    function idcardUpload() {
        let form = document.idcardUploadForm;
        form.uploadfile.click();
        let btn = form.idcardSubmitBtn;
        btn.style.display = "";
    }
</script>

<!-- 계좌번호 선택시 그 계좌가 하나머니 연동계좌로 설정 -->
<script>
    $(document).ready(function () {
        $('.account-link').click(function (event) {
            event.preventDefault();

            const accountNum = $(this).data('accountnum');
            console.log(accountNum);

            $.ajax({
                type: 'POST',
                url: '${path}/hanamoney/link-account',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                data: {
                    accountNum: accountNum
                },
                dataType: "text",
                success: function (response) {
                    // 성공시 처리
                    console.log(response);

                    if (response === '하나머니 계좌연동 성공!') {
                        $('#success').trigger('click')
                    } else {
                        $('#fail').trigger('click')
                    }

                },
                error: function (error) {
                    // 실패시 처리
                    console.error(error);
                    $('#error').trigger('click')
                }
            });
        });
    });
</script>

</body>

</html>