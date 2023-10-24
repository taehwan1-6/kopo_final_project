<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- START CATEGORY -->
<section class="section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section-title text-center">
                    <h3 class="title">챌린지 카테고리 </h3>
                    <p class="text-muted">다양한 챌린지들과 함께 어제보다 성장한 자신이 되어보세요!</p>
                </div>
            </div>
            <!--end col-->
        </div>
        <!--end row-->

        <div class="row justify-content-center">


            <c:forEach items="${categories}" var="category">
                <div class="col-lg-4 col-md-6 mt-4 pt-2">
                    <div class="popu-category-box rounded text-center">
                        <img src="${resources}/${category.imgPath}/${category.imgName}"
                             alt="" class="img-fluid" width="50%">
                        <div class="popu-category-content mt-4">
                            <a href="javascript:void(0)" class="text-dark stretched-link">
                                <h5 class="fs-18">${category.name}</h5>
                            </a>
                        </div>
                    </div><!--end popu-category-box-->
                </div>
                <!--end col-->
            </c:forEach>


        </div>
        <!--end row-->


        <div class="row">
            <div class="col-lg-12">
                <div class="mt-5 text-center">
                    <a href="${path}/challenges" class="btn btn-primary btn-hover">챌린지 하러가기 <i
                            class="uil uil-arrow-right ms-1"></i></a>
                </div>
            </div><!--end col-->
        </div><!--end row-->


    </div>
    <!--end container-->
</section>
<!-- END CATEGORY -->