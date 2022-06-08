Loading = {
  show: function () {
    $.blockUI({
      message: '<img src="/static/image/loading.gif" />',
      css: {
        zIndex: "10011",
        padding: "10px",
        left: "50%",
        width: "80px",
        marginLeft: "-40px",
      }
    });
  },
  hide: function () {
    // loading is too fast, so make some delay
    setTimeout(function () {
      $.unblockUI();
    }, 500)
  }
};