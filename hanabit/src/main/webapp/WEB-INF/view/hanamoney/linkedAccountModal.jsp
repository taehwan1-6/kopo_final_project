<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- START MODAL -->
<div class="modal fade" id="linkedAccountModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body p-5">
                <div class="position-absolute end-0 top-0 p-3">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="auth-content">
                    <div class="w-100">
                        <div class="text-center mb-4">
                            <h3><img src="${common}/assets/images/logo/hanabank.png" width="7%"/>연동계좌 설정</h3>
                        </div>


                        <div class="mb-7 mt-7 text-center">
                            <img src="${common}/assets/images/gif/linked-account.gif" width="70%"/>
                        </div>
                        <div class="mb-3 mt-5 text-center">
                            <label class="form-label">계좌를 연결하고 간편하게 충전해보세요!</label>
                            <button onclick="location.href='${path}/account/create-link'" class="btn btn-primary w-100">
                                신분증 인증하고 계좌 연결하기
                            </button>
                        </div>
                    </div>
                </div>
            </div><!--end modal-body-->
        </div><!--end modal-content-->
    </div><!--end modal-dialog-->
</div>
<!-- END MODAL -->