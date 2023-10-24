<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- navbar vertical -->
<!-- Sidebar -->
<nav class="navbar-vertical navbar">
    <div class="nav-scroller">
        <!-- Brand logo -->
        <a class="navbar-brand" href="${path}/admin">
            <img src="${path}/common/assets/images/logo/logo.png" alt=""/>
            <span class="text-white text-">관리자 페이지</span>
        </a>


        <!-- Navbar nav -->
        <ul class="navbar-nav flex-column" id="sideNavbar">

            <!-- Nav item -->
            <li class="nav-item">
                <div class="navbar-heading">컴포넌트</div>
            </li>
            <li class="nav-item">
                <div class="nav-divider"></div>
            </li>


            <!-- Nav item -->
            <li class="nav-item ">
                <a
                        class="nav-link   collapsed  "
                        href="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#navProject"
                        aria-expanded="false"
                        aria-controls="navProject"
                >
                    <i class="nav-icon fe fe-file me-2"></i> 챌린지 관리
                </a>
                <div id="navProject" class="collapse  " data-bs-parent="#sideNavbar">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link   " href="${path}/admin/challenges">
                                챌린지 목록
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="${path}/admin/challenges/create">
                                챌린지 개설
                            </a>
                        </li>

                    </ul>
                </div>
            </li>

            <!-- Nav item -->
            <li class="nav-item ">
                <a
                        class="nav-link   collapsed  "
                        href="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#navProject2"
                        aria-expanded="false"
                        aria-controls="navProject2"
                >
                    <i class="nav-icon fe fe-file me-2"></i> 금융상품 관리
                </a>
                <div id="navProject2" class="collapse  " data-bs-parent="#sideNavbar">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link   " href="${path}/admin/products">
                                금융 상품 목록
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="${path}/admin/products/create">
                                금융 상품 개설
                            </a>
                        </li>
                    </ul>
                </div>
            </li>


            <!-- Nav item -->
            <li class="nav-item">
                <a class="nav-link  collapsed " href="#" data-bs-toggle="collapse" data-bs-target="#navSiteSetting"
                   aria-expanded="false" aria-controls="navSiteSetting">
                    <i class="nav-icon fe fe-settings me-2"></i> 사이트 설정
                </a>
                <div id="navSiteSetting" class="collapse " data-bs-parent="#sideNavbar">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link " href="${path}/admin/api-setting">
                                하나은행 설정
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</nav>
