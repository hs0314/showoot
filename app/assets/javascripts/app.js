// Dom7
var $ = Dom7;
// Init App
var app = new Framework7({
  id: 'com.showoot',
  root: '#app',
  theme: 'md',
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
  panel: {
    swipe: 'left',
  },
  // touch:{
  //   disableContextMenu: false
  // },
  data: function () {
    return {
      user: {
        firstName: 'Seong Hoon',
        lastName: 'Lee',
      },
    };
  },
  methods: {
    helloWorld: function () {
      app.dialog.alert('Hello World!');
    },
  },
  routes: routes,
  vi: {
    placementId: 'pltd4o7ibb9rc653x14',
  },
});
var toast = app.toast.create({
  title: 'John Doe',
  text: 'Hello, how are you?',
  on: {
    opened: function () {
      console.log('Toast opened')
    }
  }
});

var notification = app.notification.create({
  text: 'Hello, how are you?',
  on: {
    opened: function () {
      console.log('Toast opened')
    }
  }
})

$("#ajax_test").on("click", function() {
  app.request.get("/ajax_test.js", function(data) {
    eval(data);
    // $("#ajax_test .item-title").text(data);
  });
})

// toast.open();
// notification.open();
// app.methods.helloWorld()
