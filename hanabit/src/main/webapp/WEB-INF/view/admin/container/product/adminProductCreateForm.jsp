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
<%--	<%@include file="/WEB-INF/view/include/head.jsp" %>--%>
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
                                <h1 class="mb-0 h2 fw-bold">금융 상품 개설 </h1>
                                <!-- Breadcrumb -->
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item">
                                            <a href="${path}/admin">대시보드</a>
                                        </li>
                                        <li class="breadcrumb-item">
                                            <a href="#">금융상품</a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">
                                            금융 개설
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                            <!-- button -->
                            <div>
                                <a href="${path}/admin/products" class="btn btn-primary me-2">
                                    금융상품 목록으로
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <!-- row -->





            <!-- Container fluid -->
            <div class="container p-4" style="background-color: white">

                <div class="row">

                    <form name="createProductForm" action="${path}/admin/products" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="productImgPath" value="common/assets/images/upload/product">
<%--                        <input type="hidden" name="challengeStatus" value="진행">--%>
                        <div class="row" >
                            <!-- form group -->
                            <div class="mb-3 col-12">
                                <label class="form-label">상품명 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="productName" placeholder="새롭게 개설할 상품명을 입력해주세요." required>
                            </div>
                            <!-- form group -->
                            <div class="mb-3 col-12">
                                <label class="form-label">상품 정보 설명</label>
                                <%--                                <textareaTinymce class="form-control" name="productInfoContent" placeholder="챌린지에 대한 정보 설명을 입력해주세요..." rows="3"></textareaTinymce>--%>
                                <textarea class="form-control" name="productInfoContent" placeholder="상품에 대한 정보 설명을 입력해주세요..." rows="3"></textarea>
                            </div>

                            <!-- form group -->
                            <div class="mb-3 col-md-12 col-12">
                                <label class="form-label">상품 종류</label>
                                <select class="selectpicker" data-width="100%"
                                        content="상품 종류를 선택해주세요"
                                        name="productCategory">
                                    <c:forEach items="${categoryDtos}" var="categoryDto">
                                        <option value="${categoryDto.name}">${categoryDto.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- form group -->
                            <div class="row mb-3 col-12 right-0">
                                <div class="mb-3 col-3">
                                    <label class="form-label">최소 가입 기간(월) <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" name="productMinPeriod" required>
                                </div>

                                <div class="mb-3 col-3">
                                    <label class="form-label">최대 가입 기간(월) <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" name="productMaxPeriod" required>
                                </div>
                            </div>

                            <div class="row mb-3 col-12">
                                <div class="mb-3 col-3">
                                    <label class="form-label">최소 가입 금액(원) <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" name="productMinAmount" required>
                                </div>
                                <div class="mb-3 col-3">
                                    <label class="form-label">최대 가입 금액(원) <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" name="productMaxAmount" required>
                                </div>
                            </div>

                            <div class="row mb-3 col-12">
                                <div class="mb-3 col-3">
                                    <label class="form-label">기본 금리(%) <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" step="0.01" name="productBaseRate" required>
                                </div>
                                <div class="mb-3 col-3">
                                    <label class="form-label">우대 금리(%) <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" step="0.01" name="productPreferRate" required>
                                </div>
                            </div>


                            <!-- yk식 -->
                            <div class="mt-5 mb-4">
                                <div class="row col-12">
                                    <div class="col-lg-8">
                                        <h5 class="mb-3">상품 타이틀 이미지 </h5>
                                        <input type="file" id="imageInput1" name="signImg1" style="display:none" onchange="inputFileOnchange1()"/>
                                        <input type="text" id="resultUploadPath1" class="form-control bg-light p-2"
                                               value="${ productDto.productTitleImg }" placeholder="권장 사이즈 692*418px, 이미지형식(jpg, png)" disabled>
                                    </div>
                                    <div class="col-lg-2 text-center p-5" style="width: 30%">
                                        <input type="button" class="btn btn-dark w-100 mb-0 toast-btn" onclick="inputFileClick1()" value="파일선택" />
                                    </div>
                                </div>

                            <div class="col-md-8"></div>
                            <!-- button -->
                            <div class="col-12 mt-10">
                                <button class="btn btn-primary" type="submit">개설</button>
                                </div>
                            </div>
                        </form>
                    </div>
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
    // function onchangeTextarea() {
    //     document.createProductForm.content.innerHTML = document.getElementById('mce_0_ifr').contentWindow.document.body.innerHTML;
    // }

    function inputFileClick1() {
        document.createProductForm.signImg1.click();
    }
    function inputFileOnchange1(num) {
        document.getElementById('resultUploadPath1').value = document.createProductForm.signImg1.value;
    }
</script>
<%--<script>--%>
<%--    function inputFileClick2() {--%>
<%--        document.createProductForm.signImg2.click();--%>
<%--    }--%>
<%--    function inputFileOnchange2(num) {--%>
<%--        document.getElementById('resultUploadPath2').value = document.createProductForm.signImg2.value;--%>
<%--    }--%>
<%--</script>--%>
<%--    <script>--%>
<%--        function inputFileClick3() {--%>
<%--            document.createProductForm.signImg3.click();--%>
<%--        }--%>
<%--        function inputFileOnchange3(num) {--%>
<%--            document.getElementById('resultUploadPath3').value = document.createProductForm.signImg3.value;--%>
<%--        }--%>
<%--    </script>--%>
</body>

</html>