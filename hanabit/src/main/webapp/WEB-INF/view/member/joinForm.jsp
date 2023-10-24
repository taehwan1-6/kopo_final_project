<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/view/include/head.jsp" %>
</head>

<body>
<!-- Page Content -->

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

            <!-- START SIGN-UP -->
            <section class="bg-auth">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10 col-lg-12">
                            <div class="card auth-box">
                                <div class="row align-items-center">
                                    <div class="col-lg-6 text-center">
                                        <div class="card-body p-4">
                                            <a href="index.html">
                                                <div>
                                                    <img src="${resources}/assets/images/logo.png" height="100" alt=""
                                                         class="logo-dark"
                                                         style="margin-bottom: 15px; margin-right: 5px;"/>
                                                    <%--                                                        <h5 class="title" style="color:black; display: inline-block; margin-bottom: 5px ">원큐하나빗</h5>--%>
                                                </div>
                                            </a>
                                            <%--                                                <div class="mt-5">--%>
                                            <%--                                                    <img src="/finalproject1/resources/images/auth/sign-up.png" alt="" class="img-fluid">--%>
                                            <%--                                                </div>--%>
                                        </div>
                                    </div><!--end col-->
                                    <div class="col-lg-6">
                                        <div class="auth-content card-body p-5 text-white"
                                             style="background-color: #7a60f2;">
                                            <div class="w-100">
                                                <div class="text-center">
                                                    <h5>본인인증</h5>
                                                </div>
                                                <form action="${path}/member/join" method="post" class="auth-form"
                                                      name="MemberJoinDto" onsubmit="return registerUser()">
                                                    <div class="mb-3">
                                                        <label for="userName" class="form-label">이름</label>
                                                        <input type="text" id="userName" name="name"
                                                               class="form-control" required placeholder="이름을 입력하세요">
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="email" class="form-label">이메일</label>
                                                        <input id="email" type="email" name="email" class="form-control"
                                                               required placeholder="이메일을 입력해주세요">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="password" class="form-label">비밀번호</label>
                                                        <input id="password" type="password" name="password"
                                                               class="form-control" required placeholder="비밀번호를 입력해주세요">
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="interest" class="form-label">관심사</label>
                                                        <div>
                                                            <select class="form-select"
                                                                    id="interest"
                                                                    aria-label="Default select example"
                                                                    content="관심사를 골라주세요"
                                                                    name="interest">
                                                                <c:forEach items="${categoryCodes}" var="categoryCode">
                                                                    <option value="${categoryCode.name}">
                                                                            ${categoryCode.name}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>

                                                        <%--                                                            <input id="interest" type="text" name="interest" class="form-control" required placeholder="비밀번호를 입력해주세요">--%>
                                                    </div>

                                                    <div class="mb-4">
                                                        <div class="form-check"><input id="ckBox"
                                                                                       class="form-check-input"
                                                                                       type="checkbox"
                                                                                       id="flexCheckDefault">
                                                            <label class="form-check-label" for="flexCheckDefault"> <a
                                                                    href="javascript:void(0)"
                                                                    class="text-white text-decoration-underline">회원가입 및
                                                                이용약관</a>에 동의합니다</label>
                                                        </div>
                                                    </div>
                                                    <div class="mb-4">
                                                        <div class="text-center">
                                                            <button type="button" class="btn btn-white btn-hover w-100"
                                                                    id="mailBtn">인증번호 발송
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3" id="inputAuth">
                                                        <div class="row align-items-end">
                                                            <div class="col-lg-6">
                                                                <input type="text" class="form-control" id="authNum"
                                                                       placeholder="인증번호를 입력하세요">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <button type="button"
                                                                        class="btn btn-white btn-hover w-100"
                                                                        id="checkNum">인증확인
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3" id="confirmMsg">

                                                    </div>
                                                    <div class="text-center">
                                                        <button type="submit" class="btn btn-white btn-hover w-100">
                                                            회원가입
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div><!--end col-->
                                </div><!--end row-->
                            </div><!--end auth-box-->
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </section>
            <!-- END SIGN-UP -->

        </div>
        <!-- End Page-content -->


        <!-- START FOOTER -->
        <%@include file="/WEB-INF/view/include/footer.jsp" %>
        <!-- END FOOTER -->


    </div>
    <!-- end main content-->

</div>
<!-- END layout-wrapper -->


<!-- Success Modal -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">회원가입 성공</h5>
                <div class="position-absolute end-0 top-0 p-3">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
            </div>
            <div class="modal-body">
                회원가입이 성공하였습니다!
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-soft-primary" data-dismiss="modal"
                        onclick="location.href='${path}/'">메인으로
                </button>
            </div>
        </div>
    </div>
</div>


<!-- JAVASCRIPT -->
<script>
    let authState = "0"
    $(document).ready(function () {

        let code = ''
        $("#inputAuth").hide()
        $('#mailBtn').click(function () {
            const email = $('#email').val()

            if ($('#userName').val() == '') {
                // alert('이름을 입력하세요')
                Swal.fire({
                    title: "이름을 입력하세요",
                    icon: "question",
                })
                $('#userName').focus()
            } else if ($('#idNum1').val() == '' || $('#idNum2').val() == '') {
                // alert('주민번호를 입력하세요')
                Swal.fire({
                    title: "주민번호를 입력하세요",
                    icon: "question",
                })
                $('#idNum1').focus()
            } else if ($('#number').val() == '') {
                // alert('전화번호를 입력하세요')
                Swal.fire({
                    title: "전화번호를 입력하세요",
                    icon: "question",
                })
                $('#number').focus()
            } else if ($('#email').val() == '') {
                // alert('이메일을 입력하세요')
                Swal.fire({
                    title: "이메일을 입력하세요",
                    icon: "question",
                })
                $('#email').focus()
            } else if ($('#ckBox').is(':checked') == false) {
                // alert('회원가입 및 이용약관에 동의해주세요')
                Swal.fire({
                    title: "회원가입 및 이용약관에 동의해주세요",
                    icon: "question",
                })
            } else {
                $.ajax({
                    type: 'get',
                    url: '${path}/check-mail?email=' + email,
                    success: function (data) {
                        code = data;
                        Swal.fire({
                            title: "인증번호가 전송되었습니다",
                            icon: "success",
                        })
                        $("#inputAuth").show()
                    }
                })
            }
        })

        $('#checkNum').click(function () {
            const authNum = $('#authNum').val()
            if (authNum == code) {
                $('#incorrect').remove()
                $('#confirmMsg').append('<p id="correct" style="color:blue">인증번호가 일치합니다</p>')
                authState = '1'
            } else {
                $('#correct').remove()
                $('#confirmMsg').append('<p id="incorrect" style="color:red">인증번호가 일치하지않습니다</p>')
                authState = '0'
            }

        })
    })
</script>
<script>
    function registerUser() {

        const formData = {
            name: $("#userName").val(),
            email: $("#email").val(),
            password: $("#password").val(),
            interest: $("#interest").val()
        };


        // 회원가입 요청
        $.ajax({
            type: 'POST',
            url: '${path}/member/join',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(formData),
            dataType: "text",
            success: function (response) {
                console.log(response);

                if (response === 'success') {
                    $('#successModal').modal('show');
                } else {
                    alert('회원가입에 실패했습니다.');
                }
            },
            error: function () {
                console.log(response);
                alert('서버 오류가 발생했습니다.');
            }
        });

        return false;
    }

</script>

</body>

</html>