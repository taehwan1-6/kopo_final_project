<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!--Navbar Start-->
<nav class="navbar navbar-expand-lg fixed-top sticky" id="navbar">
    <div class="container-fluid custom-container">
        <a class="navbar-brand text-dark fw-bold me-auto" href="${ path }/">
            <img src="${resources}/assets/images/logo.png" height="35" alt="" class="logo-dark"
                 style="margin-bottom: 15px; margin-right: 5px;"/>
        </a>
        <div>
            <button class="navbar-toggler me-3" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-label="Toggle navigation">
                <i class="mdi mdi-menu"></i>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mx-auto navbar-center">


                <li class="nav-item">
                    <a href="${path}/challenges" class="nav-link">챌린지</a>
                </li>
                <li class="nav-item">
                    <a href="${path}/gifticon" class="nav-link">기프트샵</a>
                </li>


                <c:if test="${empty currentMember}">
                    <li class="nav-item mobile-only-login">
                        <a href="${path}/member/login-mobile" class="nav-link">로그인</a>
                    </li>
                </c:if>

                <!-- 로그인 -->
                <c:if test="${ not empty currentMember }">
                    <li class="nav-item">
                        <a href="${path}/hanamoney" class="nav-link">하나머니</a>
                    </li>
                    <li class="nav-item">
                        <a href="${path}/account" class="nav-link">나의 계좌</a>
                    </li>
                    <li class="nav-item">
                        <a href="${path}/my-challenge" class="nav-link">나의 챌린지</a>
                    </li>
                </c:if>

                <li class="nav-item dropdown dropdown-hover">
                    <a class="nav-link" href="javascript:void(0)" id="jobsdropdown" role="button"
                       data-bs-toggle="dropdown">
                        금융상품
                        <div class="arrow-down"></div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-center" aria-labelledby="jobsdropdown">
                        <%--                        <li><a class="dropdown-item" href="about.html">적금상품</a></li>--%>
                        <li><a class="dropdown-item" href="${path}/product">하나빗 챌린지 정기예금</a></li>
                    </ul>
                </li>

            </ul><!--end navbar-nav-->


        </div>
        <!--end navabar-collapse-->

        <ul class="header-menu list-inline d-flex align-items-center mb-0">
            <li class="list-inline-item dropdown">
                <a href="javascript:void(0)" class="header-item" id="userdropdown" data-bs-toggle="dropdown"
                   aria-expanded="false">

                    <c:choose>
                        <c:when test="${not empty currentMember}">
                            <c:if test="${ not empty currentMember.profileImgName }">
                                <img src="${path}/${currentMember.profileImgPath}/${currentMember.profileImgName}"
                                     class="avatar-xl rounded-circle border border-1 border-secondary"
                                     style="background-color: white; width: 40px; height: 40px; margin-right: 10px"
                                     alt=""/>
                            </c:if>
                            <c:if test="${ empty currentMember.profileImgName }">
                                <img src="${common}/assets/images/upload/profile/profile-basic.png"
                                     class="avatar-xl rounded-circle border border-1 border-secondary"
                                     style="background-color: white; width: 40px; height: 40px; margin-right: 10px"
                                     alt=""/>
                            </c:if>
                            <span class="d-none d-md-inline-block fw-medium">${ currentMember.name } 님 안녕하세요!</span>
                        </c:when>
                        <c:when test="${empty currentMember}">
                        </c:when>
                    </c:choose>


                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userdropdown">
                    <li><a class="dropdown-item" href="${path}/my-challenge">마이페이지</a></li>
                    <li><a class="dropdown-item" href="${path}/member/logout">로그아웃</a></li>
                </ul>
            </li>
        </ul><!--end header-menu-->
    </div>
    <!--end container-->
</nav>
<!-- Navbar End -->

<!-- START SIGN-UP MODAL -->
<c:if test="${ not empty currentMember }">
</c:if>
<c:if test="${ empty currentMember }">
    <!-- START SIGN-UP MODAL -->
    <%@include file="/WEB-INF/view/include/loginModal.jsp" %>
    <!-- END SIGN-UP MODAL -->
</c:if>
<!-- END SIGN-UP MODAL -->