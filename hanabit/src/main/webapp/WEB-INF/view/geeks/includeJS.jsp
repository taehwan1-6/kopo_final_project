<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- Scripts -->
<!-- Libs JS -->
<script src="${geeks}/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="${geeks}/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${geeks}/assets/libs/odometer/odometer.min.js"></script>
<script src="${geeks}/assets/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${geeks}/assets/libs/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
<script src="${geeks}/assets/libs/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="${geeks}/assets/libs/flatpickr/dist/flatpickr.min.js"></script>
<script src="${geeks}/assets/libs/inputmask/dist/jquery.inputmask.min.js"></script>
<script src="${geeks}/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="${geeks}/assets/libs/quill/dist/quill.min.js"></script>
<script src="${geeks}/assets/libs/file-upload-with-preview/dist/file-upload-with-preview.min.js"></script>
<script src="${geeks}/assets/libs/dragula/dist/dragula.min.js"></script>
<script src="${geeks}/assets/libs/bs-stepper/dist/js/bs-stepper.min.js"></script>
<script src="${geeks}/assets/libs/dropzone/dist/min/dropzone.min.js"></script>
<script src="${geeks}/assets/libs/jQuery.print/jQuery.print.js"></script>
<script src="${geeks}/assets/libs/prismjs/prism.js"></script>
<script src="${geeks}/assets/libs/prismjs/components/prism-scss.min.js"></script>
<script src="${geeks}/assets/libs/@yaireo/tagify/dist/tagify.min.js"></script>
<script src="${geeks}/assets/libs/tiny-slider/dist/min/tiny-slider.js"></script>
<script src="${geeks}/assets/libs/@popperjs/core/dist/umd/popper.min.js"></script>
<script src="${geeks}/assets/libs/tippy.js/dist/tippy-bundle.umd.min.js"></script>
<script src="${geeks}/assets/libs/typed.js/lib/typed.min.js"></script>
<script src="${geeks}/assets/libs/jsvectormap/dist/js/jsvectormap.min.js"></script>
<script src="${geeks}/assets/libs/jsvectormap/dist/maps/world.js"></script>
<script src="${geeks}/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${geeks}/assets/libs/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
<script src="${geeks}/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="${geeks}/assets/libs/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
<script src="${geeks}/assets/libs/prismjs/plugins/toolbar/prism-toolbar.min.js"></script>
<script src="${geeks}/assets/libs/prismjs/plugins/copy-to-clipboard/prism-copy-to-clipboard.min.js"></script>
<script src="${geeks}/assets/libs/fullcalendar/main.min.js"></script>


<!-- CDN File for moment -->
<script src='https://cdn.jsdelivr.net/npm/moment@2.29.1/min/moment.min.js'></script>



<!-- Theme JS -->
<script src="${geeks}/assets/js/theme.min.js"></script>

<!-- 자바스크립트 -->
<script src="${geeks}/assets/libs/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<%--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>