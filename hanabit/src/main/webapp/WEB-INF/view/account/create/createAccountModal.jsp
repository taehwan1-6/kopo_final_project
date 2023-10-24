<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- START MODAL -->
<div class="modal fade" id="createAccountModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body p-5">
                <div class="position-absolute end-0 top-0 p-3">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="post" action="${path}/account/create">
                    <div class="auth-content">
                        <div class="w-100">
                        <div class="text-center mb-4">
                            <h3>계좌 개설 정보</h3>
                        </div>
                            <div class="mb-3 text-center">
                                <img src="${common}/assets/images/gif/bank-account.gif" width="50%"/>
                            </div>
                            <div class="mb-3 mt-2">
                                <label for="passwordInput" class="form-label">계좌 정보</label>
                                <input type="text" class="form-control" name="productName" value="보통예금" placeholder="하나은행 보통예금" disabled>
                                <input type="hidden" class="form-control" name="productName" value="보통예금">
                                <input type="hidden" class="form-control" name="type" value="입출금">
                                <input type="hidden" class="form-control" name="bankCode" value="하나">
                            </div>
                            <div class="mb-3 mt-2">
                                <label for="passwordInput" class="form-label">계좌 비밀번호</label>
                                <input type="password" class="form-control" id="passwordInput" name="password" placeholder="비밀번호를 4자리를 입력하세요">
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary w-100">설정하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div><!--end modal-body-->
        </div><!--end modal-content-->
    </div><!--end modal-dialog-->
</div>
<!-- END MODAL -->