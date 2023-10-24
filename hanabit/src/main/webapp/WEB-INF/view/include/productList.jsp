<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- START JOB-LIST -->
<section class="section bg-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section-title text-center mb-4 pb-2">
                    <h4 class="title">금융 상품</h4>
                    <p class="text-muted mb-1">다양한 금융 상품을 만나보세요 </p>
                </div>
            </div><!--end col-->
        </div><!--end row-->
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <ul class="job-list-menu nav nav-pills nav-justified flex-column flex-sm-row mb-4" id="pills-tab"
                    role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="recent-jobs-tab" data-bs-toggle="pill"
                                data-bs-target="#recent-jobs" type="button" role="tab" aria-controls="recent-jobs"
                                aria-selected="true">모든 상품
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="featured-jobs-tab" data-bs-toggle="pill"
                                data-bs-target="#featured-jobs" type="button" role="tab" aria-controls="featured-jobs"
                                aria-selected="false">정기예금
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="freelancer-tab" data-bs-toggle="pill"
                                data-bs-target="#freelancer" type="button" role="tab" aria-controls="freelancer"
                                aria-selected="false">적금
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="part-time-tab" data-bs-toggle="pill"
                                data-bs-target="#part-time" type="button" role="tab" aria-controls="part-time"
                                aria-selected="false">입출금 예금
                        </button>
                    </li>
                </ul>
            </div>
            <!--end col-->
        </div>
        <!--end row-->
        <div class="row">
            <div class="col-lg-12">
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="recent-jobs" role="tabpanel"
                         aria-labelledby="recent-jobs-tab">

                        <c:forEach items="${products}" var="product">
                            <div class="job-box card mt-4">
                                <div class="p-4">
                                    <div class="row align-items-center">


                                        <div class="col-md-2">
                                            <div class="text-center mb-4 mb-md-0">
                                                <a href="company-details.html"><img
                                                        src="${resources}/assets/images/featured-job/img-01.png" alt=""
                                                        class="img-fluid rounded-3"></a>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-3">
                                            <div class="mb-2 mb-md-0">
                                                <h5 class="fs-18 mb-1"><a href="job-details.html"
                                                                          class="text-dark">${product.productName}</a>
                                                </h5>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-3">
                                            <div class="d-flex mb-2">
                                                <div class="flex-shrink-0">
                                                </div>
                                                <p class="text-muted mb-0">
                                                    <fmt:formatNumber
                                                            value="${product.productBaseRate + product.productPreferRate}"
                                                            pattern="#.##"/>%
                                                </p>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-2">
                                            <div>
                                                <p class="text-muted mb-2"><span class="text-primary">$</span>1000-1200/m
                                                </p>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-2">
                                            <div>
                                                <c:choose>
                                                    <c:when test="${product.productCategory == '정기예금'}">
                                                        <span class="badge bg-soft-success fs-13 mt-1">정기예금</span>
                                                    </c:when>
                                                    <c:when test="${product.productCategory == '입출금'}">
                                                        <span class="badge bg-soft-success fs-13 mt-1">입출금 예금</span>
                                                    </c:when>
                                                    <c:when test="${product.productCategory == '적금'}">
                                                        <span class="badge bg-soft-success fs-13 mt-1">적금</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!-- 예상치 못한 다른 상태에 대한 처리 -->
                                                        <span class="badge bg-soft-success fs-13 mt-1">null</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->
                                </div>
                                <div class="p-3 bg-light">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div>
                                                <p class="text-muted mb-0"><span class="text-dark">Experience :</span> 1
                                                    - 2 years</p>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-lg-6 col-md-5">
                                            <div>
                                                <p class="text-muted mb-0"><span class="text-dark">Notes :</span>
                                                    languages only differ in their grammar. </p>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-lg-2 col-md-3">
                                            <div class="text-start text-md-end">
                                                <a href="#applyNow" data-bs-toggle="modal" class="primary-link">Apply
                                                    Now <i
                                                            class="mdi mdi-chevron-double-right"></i></a>
                                            </div>
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->
                                </div>
                            </div>
                            <!--end job-box-->
                        </c:forEach>


                        <div class="text-center mt-4 pt-2">
                            <a href="job-list.html" class="btn btn-primary">금융 상품 보러가기 <i
                                    class="uil uil-arrow-right"></i></a>
                        </div>
                    </div>
                    <!--end full-time-tab-->
                </div>
            </div>
            <!--end col-->
        </div>
        <!--end row-->
    </div>
    <!--end container-->
</section>
<!-- END JOB-LIST -->