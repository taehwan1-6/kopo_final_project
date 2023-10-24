<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- START HOME -->
<section class="bg-home2" id="home">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-7">
                <div class="mb-4 pb-3 me-lg-5">
                    <h1 class="display-5 fw-semibold mb-3"><span class="text-primary fw-bold">하나빗</span>에서 차별화된 서비스를 지금
                        바로 경험해보세요!</h1>
                    <p class="lead text-muted mb-0">
                        올바른 저축습관과 생활습관을 한번에!
                        게다가 우대금리까지!<br></p>
                </div>


            </div>
            <!--end col-->
            <div class="col-lg-5">
                <div class="mt-5 mt-md-0">
                    <img src="${resources}/assets/images/hero-img.gif" alt="" class="home-img"/>
                </div>
            </div><!--end col-->
        </div>
        <!--end row-->
    </div>
    <!--end container-->
</section>
<!-- End Home -->