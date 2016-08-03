$(document).ready(function () {
  
  var $orders = $('.order')
  
  $('#order_filter_status').on('change', function() {
    var currentStatus = this.value;
    $orders.each(function (index, order) {
      $order = $(order);
      if ($order.data('status') === currentStatus) {
        $order.show();  
      } else {
        $order.hide();
      }  
    });
  });
  
  $("#admin-orders").click(function () {
    $("#admin-orders-target").slideToggle(400)
  });
  
  $("#admin-account").click( function () {
    $("#admin-account-target").slideToggle(400)
  });
});

