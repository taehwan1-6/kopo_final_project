<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!-- START TOP-BAR -->
<div class="top-bar" style="background: white;">
    <div class="container-fluid custom-container">
        <div class="row g-0 align-items-center">
            <div class="col-md-7">
            </div>
            <!--end col-->
            <div class="col-md-5">
                <ul class="list-inline mb-0 text-center text-md-end">
                    <li class="list-inline-item py-2 me-2 align-middle">
                        <c:if test="${ not empty currentMember }">
                            <a href="${pageContext.request.contextPath}/member/logout"
                               class="text-dark fw-medium fs-13"><i class="uil uil-lock"></i>
                                로그아웃</a>
                        </c:if>
                        <c:if test="${ empty currentMember }">
                            <a href="#signupModal" class="text-dark fw-medium fs-13" data-bs-toggle="modal"><i
                                    class="uil uil-lock"></i>
                                로그인</a>
                        </c:if>
                    </li>
                    <li class="list-inline-item align-middle">
                        <div class="dropdown d-inline-block language-switch">
                            <button type="button" class="btn" data-bs-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <a href="#" class="text-dark fw-medium fs-13"> 고객센터</a>
                            </button>
                        </div>
                    </li>
                </ul>
            </div>
            <!--end col-->
        </div>
        <!--end row-->
    </div>
    <!--end container-->
</div>
<!-- END TOP-BAR -->


<!-- START SIGN-UP MODAL -->
<c:if test="${ not empty currentMember }">
</c:if>
<c:if test="${ empty currentMember }">
    <!-- START SIGN-UP MODAL -->
    <%@include file="/WEB-INF/view/include/loginModal.jsp" %>
    <!-- END SIGN-UP MODAL -->
</c:if>
<!-- END SIGN-UP MODAL -->
