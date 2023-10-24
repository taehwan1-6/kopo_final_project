<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- START FOOTER -->
<section class="bg-footer mt-10">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="footer-item mt-4 mt-lg-0 me-lg-5">
                    <h4 class="text-white mb-4"><img src="${resources}/assets/images/logo.png" height="35" alt=""
                                                     class="logo-dark" style="margin-bottom: 15px; margin-right: 5px;"/>
                    </h4>
                    <p class="text-white-50">금융과 챌린지를 결합한 새로운 플랫폼 원큐하나빗 서비스를 이용해보세요.</p>
                    <p class="text-white mt-3">팔로우:</p>
                    <ul class="footer-social-menu list-inline mb-0">
                        <li class="list-inline-item"><a href="#"><i class="uil uil-facebook-f"></i></a></li>
                        <li class="list-inline-item"><a href="#"><i class="uil uil-linkedin-alt"></i></a></li>
                        <li class="list-inline-item"><a href="#"><i class="uil uil-google"></i></a></li>
                        <li class="list-inline-item"><a href="#"><i class="uil uil-twitter"></i></a></li>
                    </ul>
                </div>
            </div><!--end col-->
            <div class="col-lg-2 col-6">
                <div class="footer-item mt-4 mt-lg-0">
                    <p class="fs-16 text-white mb-4">회사</p>
                    <ul class="list-unstyled footer-list mb-0">
                        <li><a href="about.html"><i class="mdi mdi-chevron-right"></i> 회사 소개</a></li>
                        <li><a href="contact.html"><i class="mdi mdi-chevron-right"></i> 연락처</a></li>
                        <li><a href="services.html"><i class="mdi mdi-chevron-right"></i> 서비스</a></li>
                        <li><a href="blog.html"><i class="mdi mdi-chevron-right"></i> 블로그</a></li>
                        <li><a href="team.html"><i class="mdi mdi-chevron-right"></i> 팀</a></li>
                        <li><a href="pricing.html"><i class="mdi mdi-chevron-right"></i> 가격</a></li>
                    </ul>
                </div>
            </div><!--end col-->
            <div class="col-lg-2 col-6">
                <div class="footer-item mt-4 mt-lg-0">
                    <p class="fs-16 text-white mb-4">구직 정보</p>
                    <ul class="list-unstyled footer-list mb-0">
                        <li><a href="job-categories.html"><i class="mdi mdi-chevron-right"></i> 카테고리 검색</a></li>
                        <li><a href="job-list.html"><i class="mdi mdi-chevron-right"></i> 직업 검색</a></li>
                        <li><a href="job-details.html"><i class="mdi mdi-chevron-right"></i> 직업 상세 정보</a></li>
                        <li><a href="bookmark-jobs.html"><i class="mdi mdi-chevron-right"></i> 북마크한 직업</a></li>
                    </ul>
                </div>
            </div><!--end col-->
            <div class="col-lg-2 col-6">
                <div class="footer-item mt-4 mt-lg-0">
                    <p class="text-white fs-16 mb-4">후보자 정보</p>
                    <ul class="list-unstyled footer-list mb-0">
                        <li><a href="candidate-list.html"><i class="mdi mdi-chevron-right"></i> 후보자 목록</a></li>
                        <li><a href="candidate-grid.html"><i class="mdi mdi-chevron-right"></i> 후보자 그리드</a></li>
                        <li><a href="candidate-details.html"><i class="mdi mdi-chevron-right"></i> 후보자 상세 정보</a></li>
                    </ul>
                </div>
            </div><!--end col-->
            <div class="col-lg-2 col-6">
                <div class="footer-item mt-4 mt-lg-0">
                    <p class="fs-16 text-white mb-4">지원</p>
                    <ul class="list-unstyled footer-list mb-0">
                        <li><a href="contact.html"><i class="mdi mdi-chevron-right"></i> 도움말 센터</a></li>
                        <li><a href="faqs.html"><i class="mdi mdi-chevron-right"></i> 자주 묻는 질문</a></li>
                        <li><a href="privacy-policy.html"><i class="mdi mdi-chevron-right"></i> 개인정보 처리방침</a></li>
                    </ul>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section>
<!-- END FOOTER -->

<!-- START FOOTER-ALT -->
<div class="footer-alt">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <p class="text-white-50 text-center mb-0">
                    <script>document.write(new Date().getFullYear())</script> &copy; (주)원큐하나빗
                </p>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</div>
<!-- END FOOTER -->

<!-- Style switcher -->
<div id="style-switcher" onclick="toggleSwitcher()" style="left: -165px; visibility: hidden">
    <div>
        <h6>Select your color</h6>
        <ul class="pattern list-unstyled mb-0">
            <li>
                <a class="color-list color1" href="javascript: void(0);" onclick="setColorGreen()"></a>
            </li>
            <li>
                <a class="color-list color2" href="javascript: void(0);" onclick="setColor('blue')"></a>
            </li>
            <li>
                <a class="color-list color3" href="javascript: void(0);" onclick="setColor('purple')"></a>
            </li>
        </ul>
        <div class="mt-3">
            <h6>Light/dark Layout</h6>
            <div class="text-center mt-3">
                <!-- light-dark mode -->
                <a href="javascript: void(0);" id="mode" class="mode-btn text-white rounded-3">
                    <i class="uil uil-brightness mode-dark mx-auto"></i>
                    <i class="uil uil-moon mode-light"></i>
                </a>
                <!-- END light-dark Mode -->
            </div>
        </div>
    </div>
    <div class="bottom">
        <a href="javascript: void(0);" class="settings rounded-end"><i class="mdi mdi-cog mdi-spin"></i></a>
    </div>
</div>
<!-- end switcher-->

<!--start back-to-top-->
<button onclick="topFunction()" id="back-to-top">
    <i class="mdi mdi-arrow-up"></i>
</button>
<!--end back-to-top-->
</div>
<!-- end main content-->

</div>
<!-- END layout-wrapper -->


<!-- JQuery -->
<script
        src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous">
</script>

<!-- JAVASCRIPT -->
<script src="${resources}/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://unicons.iconscout.com/release/v4.0.0/script/monochrome/bundle.js"></script>


<!-- Choice Js -->
<script src="${resources}/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>

<!-- Swiper Js -->
<script src="${resources}/assets/libs/swiper/swiper-bundle.min.js"></script>

<!-- Index Js -->
<script src="${resources}/assets/js/pages/job-list.init.js"></script>

<!-- Switcher Js -->
<script src="${resources}/assets/js/pages/switcher.init.js"></script>

<script src="${resources}/assets/js/pages/index.init.js"></script>

<!-- App Js -->
<script src="${resources}/assets/js/app.js"></script>


<!--Custom Css-->
<script src="https://kit.fontawesome.com/6bcbeb2a29.js" crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<%--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>