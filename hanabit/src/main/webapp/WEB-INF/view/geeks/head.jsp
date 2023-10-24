<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
      content="Geeks is a fully responsive and yet modern premium bootstrap template. Geek is feature-rich components and beautifully designed pages that help you create the best possible website and web application projects."/>
<meta name="keywords"
      content="Geeks UI, bootstrap, bootstrap 5, Course, Sass, landing, Marketing, admin themes, bootstrap admin, bootstrap dashboard, ui kit, web app, multipurpose"/>


<!-- Favicon icon-->
<link href="${ common }/assets/images/logo/logo.png" rel="icon">
<link href="${ common }/assets/images/logo/logo.png" rel="apple-touch-icon">

<!-- Libs CSS -->
<link href="${geeks}/assets/fonts/feather/feather.css" rel="stylesheet">
<link href="${geeks}/assets/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"/>
<link href="${geeks}/assets/libs/dragula/dist/dragula.min.css" rel="stylesheet"/>
<link href="${geeks}/assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet"/>
<link href="${geeks}/assets/libs/dropzone/dist/dropzone.css" rel="stylesheet"/>
<link href="${geeks}/assets/libs/magnific-popup/dist/magnific-popup.css" rel="stylesheet"/>
<link href="${geeks}/assets/libs/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
<link href="${geeks}/assets/libs/@yaireo/tagify/dist/tagify.css" rel="stylesheet">
<link href="${geeks}/assets/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet">
<link href="${geeks}/assets/libs/tippy.js/dist/tippy.css" rel="stylesheet">
<link href="${geeks}/assets/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link href="${geeks}/assets/libs/prismjs/themes/prism-okaidia.min.css" rel="stylesheet">

<!-- Theme CSS -->
<link rel="stylesheet" href="${geeks}/assets/css/theme.min.css">
<title>(주)원큐하나빗</title>

<!-- my css -->
<link rel="stylesheet" href="${geeks}/assets/libs/bootstrap-select/dist/css/bootstrap-select.min.css">