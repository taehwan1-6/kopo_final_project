<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/view/geeks/head.jsp" %>
</head>

<body>

<!-- Wrapper -->
<div id="db-wrapper">

    <!-- Nav Side Bar-->
    <%@include file="/WEB-INF/view/admin/include/adminSidebar.jsp" %>

    <!-- Page Content -->
    <div id="page-content">
        <div class="header">
            <%@include file="/WEB-INF/view/admin/include/adminNavbar.jsp" %>
        </div>

        <!-- Page Header -->
        <!-- Container fluid -->
        <div class="container-fluid p-4">
            <div class="row ">
                <div class="col-lg-12 col-md-12 col-12">
                    <!-- Page header -->
                    <div class="border-bottom pb-4 mb-4 d-md-flex align-items-center justify-content-between">
                        <div class="mb-3 mb-lg-0">
                            <h1 class="mb-0 h2 fw-bold">챌린지 목록 </h1>
                            <!-- Breadcrumb -->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="${path}/admin">대시보드</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="#">챌린지</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        챌린지 목록
                                    </li>
                                </ol>
                            </nav>
                        </div>
                        <!-- button -->
                        <div>
                            <a href="#" class="btn btn-primary me-2" data-bs-toggle="offcanvas"
                               data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                                챌린지 개설하기
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- row -->

            <div class="row justify-content-md-between mb-4 mb-xl-0 ">
                <!-- col -->
                <div class="col-xl-3 col-lg-4 col-md-6 col-12">
                    <!-- search -->
                    <div class="mb-2 mb-lg-4">
                        <input type="search" class="form-control" placeholder="챌린지 이름 검색"/>
                    </div>
                </div>
                <div class="col-xxl-1 col-lg-2 col-md-6 col-12 ">
                    <!-- Custom select -->
                    <select class="selectpicker" data-width="100%">
                        <option value="">전체보기</option>
                        <c:forEach items="${categoryDtos}" var="categoryDto">
                            <option value="${categoryDto.name}">${categoryDto.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="row">
                <c:forEach items="${paging.content}" var="challengeDto">
                    <div class="col-lg-4 col-md-3 mb-4">
                        <div class="blog-box card p-2 mt-3">
                            <div class="blog-img position-relative overflow-hidden text-center" style="height: 200px;">
                                <img src="${path}/${challengeDto.challengeImgPath}/${challengeDto.challengeTitleImg}"
                                     alt="" class="img-fluid" style="width: 240px; height: 200px; object-fit: cover;">
                                <!-- object-fit 속성 적용 -->
                            </div>

                            <div class="card-body">
                                <ul class="list-inline d-flex justify-content-between mb-3">
                                    <li>
                                        <c:choose>
                                            <c:when test="${challengeDto.challengeStatus == '진행'}">
                                                <span class="badge bg-light-success text-black fs-13 mt-1">진행중</span>
                                            </c:when>
                                            <c:when test="${challengeDto.challengeStatus == '대기'}">
                                                <span class="badge bg-light-secondary text-black fs-13 mt-1">대기중</span>
                                            </c:when>
                                            <c:when test="${challengeDto.challengeStatus == '종료'}">
                                                <span class="badge bg-light-danger text-black fs-13 mt-1">종료</span>
                                            </c:when>
                                            <c:otherwise>
                                                <!-- 예상치 못한 다른 상태에 대한 처리 -->
                                                <span class="badge bg-light-info text-black fs-13 mt-1">${challengeDto.challengeStatus}null</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                </ul>

                                <a href="${path}/challenges/${challengeDto.challengeCode}" class="primary-link">
                                    <h4 class="fs-18">${challengeDto.challengeName}</h4>
                                </a>
                            </div>
                        </div><!--end blog-grid-box-->
                    </div>
                    <!--end col-->
                </c:forEach>
            </div>

            <!-- 페이징 처리 시작 -->
            <div>
                <c:if test="${not empty paging.content}">
                    <ul class="pagination justify-content-center">
                        <!-- 이전 버튼 -->
                            <%--                        <li class="page-item <c:if test="${not paging.hasPrevious}">disabled</c:if>">--%>
                            <%--                            <a class="page-link" href="?page=${paging.number - 1}">--%>
                            <%--                                <span>이전</span>--%>
                            <%--                            </a>--%>
                            <%--                        </li>--%>

                        <!-- 페이지 번호들 -->
                        <c:forEach begin="0" end="${paging.totalPages - 1}" var="pageNum">
                            <c:if test="${pageNum >= (paging.number - 5) && pageNum <= (paging.number + 5)}">
                                <li class="page-item <c:if test="${pageNum == paging.number}">active</c:if>">
                                    <a class="page-link" href="?page=${pageNum}">${pageNum}</a>
                                </li>
                            </c:if>
                        </c:forEach>

                        <!-- 다음 버튼 -->
                            <%--                        <li class="page-item <c:if test="${not paging.hasNext}">disabled</c:if>">--%>
                            <%--                            <a class="page-link" href="?page=${paging.number + 1}">--%>
                            <%--                                <span>다음</span>--%>
                            <%--                            </a>--%>
                            <%--                        </li>--%>
                    </ul>
                </c:if>
            </div>
            <!-- 페이징 처리 끝 -->

        </div>
    </div>
</div>


<!-- Offcanvas -->

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" style="width: 600px;">

    <div class="offcanvas-body scrollbar ">
        <div class="offcanvas-header px-2 pt-0">
            <h3 class="offcanvas-title" id="offcanvasExampleLabel">챌린지 개설</h3>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <!-- card body -->
        <div class="container">
            <!-- form -->
            <form name="createChallengeForm" action="${path}/admin/challenges" method="post"
                  enctype="multipart/form-data">
                <input type="hidden" name="challengeImgPath" value="common/assets/images/upload/challenge">
                <input type="hidden" name="challengeStatus" value="진행">
                <div class="row">
                    <!-- form group -->
                    <div class="mb-3 col-12">
                        <label class="form-label">챌린지명 <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="challengeName" placeholder="새롭게 개설할 챌린지명을 입력해주세요."
                               required>
                    </div>
                    <!-- form group -->
                    <div class="mb-3 col-12">
                        <label class="form-label">챌린지 리워드 금액<span class="text-danger">*</span></label>
                        <input type="number" class="form-control" name="challengeRewardAmount"
                               placeholder="리워드로 지급할 금액을 입력해주세요." required>
                    </div>
                    <!-- form group -->
                    <div class="mb-3 col-12">
                        <label class="form-label">챌린지 요약 설명</label>
                        <%--                                <textareaTinymce class="form-control" name="challengeInfoContent" placeholder="챌린지에 대한 정보 설명을 입력해주세요..." rows="3"></textareaTinymce>--%>
                        <textarea class="form-control" name="challengeInfoSummary"
                                  placeholder="챌린지에 대한 요약 설명을 입력해주세요..." rows="3"></textarea>
                    </div>
                    <!-- form group -->
                    <div class="mb-3 col-12">
                        <label class="form-label">챌린지 정보 설명</label>
                        <%--                                <textareaTinymce class="form-control" name="challengeInfoContent" placeholder="챌린지에 대한 정보 설명을 입력해주세요..." rows="3"></textareaTinymce>--%>
                        <textarea class="form-control" name="challengeInfoContent"
                                  placeholder="챌린지에 대한 정보 설명을 입력해주세요..." rows="3"></textarea>
                    </div>
                    <!-- form group -->
                    <div class="mb-3 col-12">
                        <label class="form-label">챌린지 인증 설명</label>
                        <textarea class="form-control" name="challengeAuthContent"
                                  placeholder="챌린지에 대한 인증 설명을 입력해주세요..." rows="3"></textarea>
                    </div>

                    <!-- form group -->
                    <div class="mb-3 col-md-12 col-12">
                        <label class="form-label">카테고리</label>
                        <select class="selectpicker" data-width="100%"
                                content="카테고리를 선택해주세요"
                                name="challengeCategory">
                            <c:forEach items="${categoryDtos}" var="categoryDto">
                                <option value="${categoryDto.name}">${categoryDto.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- yk식 -->
                    <div class="mt-5 mb-4">
                        <div class="row col-12">
                            <div class="col-lg-8">
                                <h5 class="mb-3">챌린지 타이틀 이미지 </h5>
                                <input type="file" id="imageInput1" name="signImg1" style="display:none"
                                       onchange="inputFileOnchange1()"/>
                                <input type="text" id="resultUploadPath1" class="form-control bg-light p-2"
                                       value="${ challengeDto.challengeTitleImg }"
                                       placeholder="권장 사이즈 692*418px, 이미지형식(jpg, png)" disabled>
                            </div>
                            <div class="col-lg-2 text-center p-5" style="width: 30%">
                                <input type="button" class="btn btn-dark w-100 mb-0 toast-btn"
                                       onclick="inputFileClick1()" value="파일선택"/>
                            </div>
                        </div>
                        <div class="row col-12">
                            <div class="col-lg-8">
                                <h5 class="mb-3">챌린지 인증 이미지 </h5>
                                <input type="file" id="imageInput3" name="signImg3" style="display:none"
                                       onchange="inputFileOnchange3()"/>
                                <input type="text" id="resultUploadPath3" class="form-control bg-light p-2"
                                       value="${ challengeDto.challengeTitleImg }"
                                       placeholder="권장 사이즈 692*418px, 이미지형식(jpg, png)" disabled>
                            </div>
                            <div class="col-lg-2 text-center p-5" style="width: 30%">
                                <input type="button" class="btn btn-dark w-100 mb-0 toast-btn"
                                       onclick="inputFileClick3()" value="파일선택"/>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-8"></div>
                    <!-- button -->
                    <div class="col-12 mt-10">
                        <button class="btn btn-primary" type="submit">개설</button>
                        <button type="button" class="btn btn-outline-primary ms-2" data-bs-dismiss="offcanvas"
                                aria-label="Close">닫기
                        </button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>


<!-- JAVASCRIPT -->
<%@include file="/WEB-INF/view/geeks/includeJS.jsp" %>

<script src="https://cdn.tiny.cloud/1/q5exsmhowsc20ob45wxsqhumfi3xwfkcbfigonbdvrui6m27/tinymce/6/tinymce.min.js"
        referrerpolicy="origin"></script>
<script>
    tinymce.init({
        selector: 'textarea',
        plugins: 'a11ychecker advcode casechange export formatpainter image editimage linkchecker autolink lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tableofcontents tinycomments tinymcespellchecker',
        toolbar: [
            'undo redo | bold italic underline strikethrough blockquote | fontfamily fontsize blocks',
            'alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist checklist | forecolor backcolor removeformat | image media pageembed table'],
        toolbar_mode: 'floating',
        tinycomments_mode: 'embedded',
        tinycomments_author: 'Author name',
        file_picker_types: 'image',
        /* and here's our custom image picker*/
        file_picker_callback: (cb, value, meta) => {
            const input = document.createElement('input');
            input.setAttribute('type', 'file');
            input.setAttribute('accept', 'image/*');

            input.addEventListener('change', (e) => {
                const file = e.target.files[0];

                const reader = new FileReader();
                reader.addEventListener('load', () => {
                    /*
                      Note: Now we need to register the blob in TinyMCEs image blob
                      registry. In the next release this part hopefully won't be
                      necessary, as we are looking to handle it internally.
                    */
                    const id = 'blobid' + (new Date()).getTime();
                    const blobCache = tinymce.activeEditor.editorUpload.blobCache;
                    const base64 = reader.result.split(',')[1];
                    const blobInfo = blobCache.create(id, file, base64);
                    blobCache.add(blobInfo);

                    /* call the callback and populate the Title field with the file name */
                    cb(blobInfo.blobUri(), {title: file.name});
                });
                reader.readAsDataURL(file);
            });

            input.click();
        },
        content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
    });

</script>


<script>
    function inputFileClick1() {
        document.createChallengeForm.signImg1.click();
    }

    function inputFileOnchange1(num) {
        document.getElementById('resultUploadPath1').value = document.createChallengeForm.signImg1.value;
    }
</script>
<script>
    function inputFileClick2() {
        document.createChallengeForm.signImg2.click();
    }

    function inputFileOnchange2(num) {
        document.getElementById('resultUploadPath2').value = document.createChallengeForm.signImg2.value;
    }
</script>
<script>
    function inputFileClick3() {
        document.createChallengeForm.signImg3.click();
    }

    function inputFileOnchange3(num) {
        document.getElementById('resultUploadPath3').value = document.createChallengeForm.signImg3.value;
    }
</script>
</body>

</html>