// Dom7
var $$ = Dom7;
// Init App
var app = new Framework7({
  id: 'com.showoot',
  root: '#app',
  theme: 'md',
  init: false,
  view: {
    // 여러 페이지를 캐시해서 뒤로가기가 여러 depth에서도 동작하게 하려면 필요한 옵션
    stackPages: true,
    pushState: true
  },
  toast: {
    closeTimeout: 3000,
    closeButton: true,
  },
  notification: {
    title: 'My App',
    closeTimeout: 3000,
  },
  routes: routes,
});

/////////////////////커스터마이징 캘린더
function customizingCalendar(){
  var monthNames=['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
  var today = new Date();
  var calendarInline = app.calendar.create({
    containerEl: '#demo-calendar-inline-container',
    value: [today],
    weekHeader: false,
    renderToolbar: function () {
      return '<div class="toolbar calendar-custom-toolbar no-shadow">' +
        '<div class="toolbar-inner">' +
          '<div class="left">' +
            '<a href="#" class="link icon-only"><i class="icon icon-back ' + (app.theme === 'md' ? 'color-black' : '') + '"></i></a>' +
          '</div>' +
          '<div class="center"></div>' +
          '<div class="right">' +
            '<a href="#" class="link icon-only"><i class="icon icon-forward ' + (app.theme === 'md' ? 'color-black' : '') + '"></i></a>' +
          '</div>' +
        '</div>' +
      '</div>';
    },
    on: {
      init: function (c) {
        $$('.calendar-custom-toolbar .center').text(monthNames[c.currentMonth] +', ' + c.currentYear);
        $$('.calendar-custom-toolbar .left .link').on('click', function () {
          calendarInline.prevMonth();
        });
        $$('.calendar-custom-toolbar .right .link').on('click', function () {
          calendarInline.nextMonth();
        });
      },
      monthYearChangeStart: function (c) {
        $$('.calendar-custom-toolbar .center').text(monthNames[c.currentMonth] +', ' + c.currentYear);
      }
    }
  });
}

$$(document).on("page:init", ".page[data-name='posts-index']", function() {
  customizingCalendar();
});

app.init();
