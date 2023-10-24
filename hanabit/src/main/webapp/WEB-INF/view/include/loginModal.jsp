<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- START SIGN-UP MODAL -->
<div class="modal fade" id="signupModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body p-5">
                <div class="position-absolute end-0 top-0 p-3">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="auth-content">
                    <div class="w-100">
                        <div class="text-center mb-4">
                            <h5>로그인</h5>
                        </div>
                        <form action="${ path }/member/login" class="auth-form" method="post">
                            <div class="mb-3">
                                <label for="emailInput" class="form-label">아이디</label>
                                <input type="text" class="form-control" id="emailInput" name="email"
                                       placeholder="이메일 형식으로 입력하세요">
                            </div>
                            <div class="mb-3">
                                <label for="passwordInput" class="form-label">비밀번호</label>
                                <input type="password" class="form-control" id="passwordInput" name="password"
                                       placeholder="비밀번호를 입력하세요">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary w-100">로그인하기</button>
                            </div>
                        </form>
                        <div class="mt-3 text-center">
                            <p class="mb-0">회원이 아니신가요? <a href="${ path }/member/join"
                                                          class="form-text  text-decoration-underline"> 회원가입하러가기 </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div><!--end modal-body-->
        </div><!--end modal-content-->
    </div><!--end modal-dialog-->
</div>
<!-- END SIGN-UP MODAL -->