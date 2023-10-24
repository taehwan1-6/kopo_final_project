<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 회원 프로필 정보 -->
<div class="row align-items-center">
    <!-- User info -->
    <div class="col-xl-12 col-lg-12 col-md-12 col-12">
        <!-- Bg -->
        <div class="pt-16 rounded-top-md" style="
                background: url(${geeks}/assets/images/background/profile-bg.jpg) no-repeat;
                background-size: cover;
                "></div>
        <div
                class="d-flex align-items-end justify-content-between bg-white px-4 pt-2 pb-4 rounded-none rounded-bottom-md shadow-sm">
            <div class="d-flex align-items-center">
                <div class="me-2 position-relative d-flex justify-content-end align-items-end mt-n5">
                    <c:if test="${ not empty currentMember.profileImgName }">
                        <img src="${path}/${currentMember.profileImgPath}/${currentMember.profileImgName}"
                             class="avatar-xl rounded-circle border border-1 border-secondary"
                             style="background-color: white"
                             alt=""/>
                    </c:if>
                    <c:if test="${ empty currentMember.profileImgName }">
                        <img src="${common}/assets/images/upload/profile/profile-basic.png"
                             class="avatar-xl rounded-circle border border-1 border-secondary"
                             style="background-color: white"
                             alt=""/>
                    </c:if>
                </div>
                <div class="lh-1">
                    <h2 class="mb-0">
                        ${currentMember.name}님
                        <a href="#" class="text-decoration-none" data-bs-toggle="tooltip" data-placement="top"
                           title="Beginner">
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <rect x="3" y="8" width="2" height="6" rx="1" fill="#754FFE"></rect>
                                <rect x="7" y="5" width="2" height="9" rx="1" fill="#DBD8E9"></rect>
                                <rect x="11" y="2" width="2" height="12" rx="1" fill="#DBD8E9"></rect>
                            </svg>
                        </a>
                    </h2>
                    <p class="mb-0 d-block">${currentMember.email}</p>
                </div>
            </div>
        </div>
    </div>
</div>
