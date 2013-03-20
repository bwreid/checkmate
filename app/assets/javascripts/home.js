$(function(){
  $("#dep_chart_btn").click(get_dep_chart_info);
  $("#wit_chart_btn").click(get_wit_chart_info);
});

var withdrawal_array = [];

function get_dep_chart_info()
{
  var id = $("#bid").text();
  $.ajax({
    dataType: 'json',
    type: "get",
    url: "/banks/"+id+"/deposit_chart"
    }).done(process_deposit_info);
  return false;
}

function get_wit_chart_info()
{
  var id = $("#bid").text();
  $.ajax({
    dataType: 'json',
    type: "get",
    url: "/banks/"+id+"/withdrawal_chart"
    }).done(process_withdrawal_info);
  return false;
}

function process_deposit_info(message)
{
  $("#deposits").empty();
  var deposits_array = [];
  _.each(message, function(x){ deposits_array.push({amount:x.amount, date:x.tdate})});
  new Morris.Bar({
  // ID of the element in which to draw the chart.
  element: 'deposits',
  // Chart data records -- each entry in this array corresponds to a point on
  // the chart.
  data: deposits_array,
  // The name of the data record attribute that contains x-values.
  xkey: 'date',
  // A list of names of data record attributes that contain y-values.
  ykeys: ['amount'],
  // Labels for the ykeys -- will be displayed when you hover over the
  // chart.
  labels: ['amount'],
  ymin:"auto",
  ymax:"auto"
});

}

function process_withdrawal_info(message)
{
  $("#withdrawals").empty();
  var withdrawals_array = [];
  _.each(message, function(x){ withdrawals_array.push({amount:x.amount, date:x.tdate})});
  new Morris.Bar({
  // ID of the element in which to draw the chart.
  element: 'withdrawals',
  // Chart data records -- each entry in this array corresponds to a point on
  // the chart.
  data: withdrawals_array,
  // The name of the data record attribute that contains x-values.
  xkey: 'date',
  // A list of names of data record attributes that contain y-values.
  ykeys: ['amount'],
  // Labels for the ykeys -- will be displayed when you hover over the
  // chart.
  labels: ['amount'],
  ymin:"auto",
  ymax:"auto"
  });
}

