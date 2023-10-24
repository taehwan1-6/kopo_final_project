<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 마이페이지 사이드바 정보 -->
<nav class="navbar navbar-expand-md navbar-light shadow-sm mb-4 mb-lg-0 sidenav" style="margin-top: 0;">
  <!-- Menu -->
  <a class="d-xl-none d-lg-none d-md-none text-inherit fw-bold" href="#">Menu</a>
  <!-- Button -->
  <button class="navbar-toggler d-md-none icon-shape icon-sm rounded bg-primary text-light" type="button"
          data-bs-toggle="collapse" data-bs-target="#sidenav" aria-controls="sidenav" aria-expanded="false"
          aria-label="Toggle navigation">
    <span class="fe fe-menu"></span>
  </button>
  <!-- Collpase navbar -->
  <div class="collapse navbar-collapse" id="sidenav">
    <div class="navbar-nav flex-column">
      <span class="navbar-header">Subscription</span>
      <ul class="list-unstyled ms-n2 mb-4">
        <li class="nav-item">
          <a class="nav-link" href="${path}/my-challenge"><i class="fe fe-calendar nav-icon"></i>챌린지 기록</a>
        </li>
        <!-- Nav item -->
        <li class="nav-item">
          <a class="nav-link" href="${path}/account"><i class="fe fe-credit-card nav-icon"></i>나의 계좌</a>
        </li>
        <!-- Nav item -->
        <li class="nav-item active">
          <a class="nav-link" href="${path}/hanamoney"><i class="fe fe-credit-card nav-icon"></i>하나머니</a>
        </li>
      </ul>
      <!-- Navbar header -->
      <span class="navbar-header">Account Settings</span>
      <ul class="list-unstyled ms-n2 mb-0">
        <!-- Nav item -->
        <li class="nav-item">
          <a class="nav-link" href="profile-edit.html"><i class="fe fe-settings nav-icon"></i>계정 수정</a>
        </li>
        <!-- Nav item -->
        <li class="nav-item">
          <a class="nav-link" href="delete-profile.html"><i class="fe fe-trash nav-icon"></i>계정 삭제</a>
        </li>
        <!-- Nav item -->
        <li class="nav-item">
          <a class="nav-link" href="${path}/member/logout"><i class="fe fe-power nav-icon"></i>로그아웃</a>
        </li>
      </ul>
    </div>
  </div>
</nav>