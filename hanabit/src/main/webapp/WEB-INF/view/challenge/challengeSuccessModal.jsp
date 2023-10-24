<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- START MODAL -->
<button id="complete" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
    Launch static backdrop modal
</button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="">
            <div class="modal-body">
                <div class="d-flex justify-content-center mb-1">
                    <h5 class="modal-title" id="staticBackdropLabel">챌린지 인증 성공!</h5>
                </div>
                <div class="w-100 d-flex flex-column align-items-center">
                    <img alt="" src="${common}/assets/images/gif/complete.gif" width="150" height="150">
                    <button class="btn btn-soft-primary" onclick="location.href='${path}/hanamoney'">받은 하나머니 확인하러가기 <i
                            class="fa-solid fa-arrow-right"></i></button>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- END MODAL -->
