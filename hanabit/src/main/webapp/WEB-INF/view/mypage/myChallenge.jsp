<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="kr.ac.kopo.hanabit.util.LocalDateTimeToDate" %>

<c:set var="resources" value="${pageContext.request.contextPath}/jobvia"/>
<c:set var="geeks" value="${pageContext.request.contextPath}/geeks"/>
<c:set var="common" value="${pageContext.request.contextPath}/common"/>
<c:set var="hyper" value="${pageContext.request.contextPath}/hyper"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/view/include/head.jsp" %>
    <%@include file="/WEB-INF/view/geeks/head.jsp" %>

    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.3/main.min.css,npm/fullcalendar@5.11.3/main.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/package.json">

    <style>
        .pagination .page-item .page-link {
            border-radius: 40px;
            height: 20px;
            width: 10px;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            margin: 0 4px;
        }

        div.dataTables_wrapper div.dataTables_length select {
            width: 70%;
            display: inline-block;
        }

        .event-icon {
            width: 20px;
        / / 원하는 너비로 설정 height: 20 px;
        / / 원하는 높이로 설정
        }

    </style>

</head>

<body>

<!--start page Loader -->
<div id="preloader">
    <div id="status">
        <ul>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>
<!--end page Loader -->


<!-- Begin page -->
<div>

    <!-- START TOP-BAR -->
    <%@include file="/WEB-INF/view/include/topbar.jsp" %>
    <!-- END TOP-BAR -->

    <!-- Navbar Start-->
    <%@include file="/WEB-INF/view/include/navbar.jsp" %>
    <!-- Navbar End -->


    <div class="main-content">

        <div class="page-content">


            <!-- 회원 프로필 정보 -->
            <div class="mt-15 pt-5 pb-5">
                <div class="container">
                    <%@include file="/WEB-INF/view/mypage/profileTop.jsp" %>

                    <!-- Content -->

                    <div class="row mt-0 mt-md-4">
                        <div class="col-lg-3 col-md-4 col-12">
                            <!-- Side navbar -->
                            <%@include file="/WEB-INF/view/mypage/myChallengeSidebar.jsp" %>
                        </div>


                        <!-- 리스트 -->
                        <div class="col-lg-9 col-md-8" style="background-color: white">
                            <div class="col-lg-12 mt-5">
                                <div class="d-flex justify-content-start"
                                     style="padding-top: 10px; margin-left: 30px; background-color:#f3f2f2; border: 2px solid #f3f2f2; border-radius:20px;margin-right: 30px; padding-bottom: 10px;">
                                    <img alt="" src="${common}/assets/images/logo/hanamoney.png"
                                         style="margin-left: 70px; margin-top: 15px; height: 40px; width: 40px">
                                    <div style="font-size: 25px; font-weight: bold; margin-left: 15px;margin-top: 15px;">
                                        챌린지로 얻은 하나머니
                                    </div>
                                    <div style="font-size: 45px; font-weight: bold; color: #b4a7ee; margin-left: 150px;">
                                        ${sumPoint}원
                                    </div>
                                </div>
                            </div>


                            <div class="col-lg-12 mt-3">
                                <nav class="pro-detail-area">
                                    <div class="nav nav-tabs border-bottom detail-title" id="nav-tab" role="tablist">
                                        <a class="nav-link border-0 active" id="nav-home-tab" data-bs-toggle="tab"
                                           href="#nav-home"
                                           role="tab" aria-controls="nav-home" aria-selected="true">내 챌린지 내역</a>
                                        <a class="nav-link border-0" id="nav-profile-tab" data-bs-toggle="tab"
                                           href="#nav-profile"
                                           role="tab" aria-controls="nav-profile" aria-selected="false" onclick="cal()">캘린더</a>
                                    </div>
                                </nav>

                                <div class="tab-content py-4" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                                         aria-labelledby="nav-home-tab">

                                        <div data-simplebar>
                                            <div class="me-3">

                                                <table id="userPointTables"
                                                       class="w-100 table table-striped table-borderless">
                                                    <thead>
                                                    <tr style="background-color: #7a60f2; color: white;">
                                                        <th>번호</th>
                                                        <th>날짜</th>
                                                        <th>챌린지</th>
                                                        <th>적립 하나머니</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>

                                    <!-- 달력 -->
                                    <div class="tab-pane fade" id="nav-profile" role="tabpanel"
                                         aria-labelledby="nav-profile-tab" style="width: 850px; height: 700px;">
                                        <div id='calendar' style="width: 800px;"></div>
                                    </div>

                                </div>

                            </div>

                        </div>
                        <!-- end detail tab -->

                    </div>
                    <!-- END ROW -->


                </div>
            </div>


        </div>
        <!-- End Page-content -->


    </div>
    <!-- end main content-->

</div>
<!-- END layout-wrapper -->
<!-- START FOOTER -->
<%@include file="/WEB-INF/view/include/footer.jsp" %>
<!-- END FOOTER -->


<!-- Modal -->


<!-- JAVASCRIPT -->
<script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.3/main.min.js"></script>


<script>

    function cal() {

        var form = new FormData();
        form.append("challengeCode", "${challengeCode}");

        $.ajax({
            type: 'post',
            url: "${ path }/my-challenge/calendar",
            method: "post",
            data: form,
            dataType: "json",
            processData: false,
            contentType: false,
            cache: false,
            success: function (result) {

                console.log(result);

                var calendarEl = document.getElementById('calendar');

                var calendar = new FullCalendar.Calendar(calendarEl, {
                    height: '600px',
                    initialView: 'dayGridMonth',
                    dayMaxEvents: true,
                    eventColor: 'white',
                    headerToolbar: {
                        start: 'prev next today',
                        center: 'title',
                        end: 'dayGridMonth,dayGridWeek,dayGridDay'
                    },
                    locale: "ko",
                    editable: true,

                    drop: function (arg) {
                        if (document.getElementById('drop-remove').checked) {
                            arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                        }
                    },

                    events: result,

                    eventContent: function (result) {
                        var eventTitle = result.event.title;

                        return {
                            html: `<div>
                                  ${eventTitle}
                                  <img src="${path}/common/assets/images/challenge/challenge-check.png" class="event-icon" />

                                </div>`


                        };
                    }


                });

                calendar.render();
            },
            error: function () {
                alert('실패')
            }
        })


    };


</script>

<script>
    $('#userPointTables').DataTable({
        ajax: {
            url: '${path}/my-challenge/log',
            type: 'Get',
            dataSrc: function (res) {
                var data = res

                // 리스트번호
                for (let i = 0; i < data.length; i++) {
                    data[i].listIndex = i + 1
                    console.log(data[i])
                }

                return data;
            }
        },

        columns: [
            {targets: 0, data: "listIndex"},
            {targets: 1, data: "CHALLENGE_LOG_DATE"},
            {targets: 2, data: "CHALLENGE_NAME"},
            {targets: 3, data: "CHALLENGE_POINT"}
        ],

        'select': {
            'style': 'multi'
        },
        'order': [[2, 'desc']],

        columnDefs: [
            {targets: 0, width: 10},
            {targets: 1, width: 20},
            {targets: 2, width: 50},
            {
                targets: 3, data: "CHALLENGE_POINT",

                "render": function (data, type, row, meta) {
                    return '<div>' + data + '원</div>';
                }, width: 20

            }
        ],
        // 스크롤바
        scrollX: true,
        scrollY: 400,

        lengthChange: false,
        // 검색(기본값 true)
        searching: false,
        info: false,

        language: {
            "paginate": {
                "first": "첫 페이지",
                "last": "마지막 페이지",
                "next": "다음",
                "previous": "이전"
            }
        }


    });
</script>


</body>

</html>
``