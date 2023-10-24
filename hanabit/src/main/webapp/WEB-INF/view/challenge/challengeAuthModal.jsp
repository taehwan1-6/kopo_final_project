<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- START MODAL -->
<div class="modal fade" id="staticBackdrop" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body p-5">
                <div class="position-absolute end-0 top-0 p-3">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="d-flex justify-content-between mb-1">
                    <h5 class="modal-title" id="staticBackdropLabel">챌린지 인증하기</h5>
                </div>

                <div class="d-flex flex-column align-items-center">

                    <form enctype="multipart/form-data" name="challengeMark" id="uploadForm">
                        <img style="width: 100%;" class="mx-auto d-block mb-2" id="preview-image"
                             src="${common}/assets/images/gif/photo.gif">
                        <div class="input-group mb-2">
                            <input type="file" class="form-control" id="input_image" name="uploadFile"
                                   multiple="multiple" style="width: 250px;"/>
                        </div>
                        <input type="button" onclick="uploadfile1()" value="인증하기"
                               class="btn btn-primary align-items-center mb-2 w-100">
                    </form>
                </div>


            </div><!--end modal-body-->
        </div><!--end modal-content-->
    </div><!--end modal-dialog-->
</div>
<!-- END MODAL -->


