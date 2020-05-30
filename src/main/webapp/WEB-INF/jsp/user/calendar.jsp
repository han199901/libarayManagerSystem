<%--
  Created by IntelliJ IDEA.
  User: 韩勇
  Date: 2020/5/29
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Calendar</title>

    <!-- Bootstrap Core and vandor -->
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../plugins/fullcalendar/fullcalendar.min.css">

    <!-- Core css -->
    <link rel="stylesheet" href="../css/style.min.css"/>
</head>

<body class="font-muli theme-cyan gradient" style="width: 80%; overflow: hidden">

<div class="section-body mt-4" style="width: 100%;">
    <div class="container-fluid">
        <div class="row clearfix row-deck">
            <div class="col-lg-4 col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title">Events List</h3>
                        <div id="event-list" class="fc event_list">
                            <div class='fc-event bg-info' data-class="bg-info">借阅图书日期</div>
                            <div class='fc-event bg-warning' data-class="bg-warning">归还图书日期</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div id="calendar"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Start Main project js, jQuery, Bootstrap -->
<script src="../bundles/lib.vendor.bundle.js"></script>

<!-- Start Plugin Js -->
<script src="../bundles/fullcalendar.bundle.js"></script>

<!-- Start project main js  and page js -->
<script src="../js/core.js"></script>
<script>
    $(function() {

        enableDrag();
        function enableDrag(){
            $('#external-events .fc-event').each(function() {
                $(this).data('event', {
                    title: $.trim($(this).text()), // use the element's text as the event title
                    stick: true // maintain when user navigates (see docs on the renderEvent method)
                });
                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true,      // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag
                });
            });
        }

        $(".save-event").on('click', function() {
            var categoryName = $('#addNewEvent form').find("input[name='category-name']").val();
            var categoryColor = $('#addNewEvent form').find("select[name='category-color']").val();
            if (categoryName !== null && categoryName.length != 0) {
                $('#event-list').append('<div class="fc-event bg-' + categoryColor + '" data-class="bg-' + categoryColor + '">' + categoryName + '</div>');
                $('#addNewEvent form').find("input[name='category-name']").val("");
                $('#addNewEvent form').find("select[name='category-color']").val("");
                enableDrag();
            }
        });



        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //January is 0!
        var yyyy = today.getFullYear();

        if(dd<10) { dd = '0'+dd }
        if(mm<10) { mm = '0'+mm }

        var current = yyyy + '-' + mm + '-' +dd;
        var calendar = $('#calendar');
        // initialize the calendar
        calendar.fullCalendar({

            header: {
                left: 'title',
                center: '',
                right: 'month, agendaWeek, agendaDay, prev, next'
            },

            editable: true,
            droppable: true,
            eventLimit: true, // allow "more" link when too many events
            selectable: true,
            events: [
                <c:forEach items="${calendar}" var="entry">
                {
                    title: '归还${entry.name}',
                    start  : '${entry.start_time}',
                    className: 'bg-info'
                },
                {
                    title: '归还${entry.name}',
                    start  : '${entry.end_time}',
                    className: 'bg-warning'
                },
                </c:forEach>
            ],

            drop: function(date,jsEvent) {

                // var originalEventObject = $(this).data('eventObject');
                // var $categoryClass = $(this).attr('data-class');
                // var copiedEventObject = $.extend({}, originalEventObject);
                // //console.log(originalEventObject + '--' + $categoryClass + '---' + copiedEventObject);
                // copiedEventObject.start = date;
                // if ($categoryClass)
                //   copiedEventObject['className'] = [$categoryClass];
                // calendar.fullCalendar('renderEvent', copiedEventObject, true);
                // is the "remove after drop" checkbox checked?

                if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                }
            },

            select: function(start, end, allDay) {
                newEvent(start);
            },

            eventClick: function(calEvent, jsEvent, view) {
                //var title = prompt('Event Title:', calEvent.title, { buttons: { Ok: true, Cancel: false} });

                var eventModal = $('#eventEditModal');
                eventModal.modal('show');
                eventModal.find('input[name="event-name"]').val(calEvent.title);

                eventModal.find('.save-btn').click(function(){
                    calEvent.title = eventModal.find("input[name='event-name']").val();
                    calendar.fullCalendar('updateEvent', calEvent);
                    eventModal.modal('hide');
                });

                // if (title){
                //     calEvent.title = title;
                //     calendar.fullCalendar('updateEvent',calEvent);
                // }
            }
        });
    });
</script>
</body>
</html>

