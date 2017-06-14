$(document).ready(function() {
  datatable_init($('#auditlog_tbl')[0], {
    'dom': "<'row'<'col-sm-6'><'col-sm-6'f>><'row'<'col-sm-6'l><'col-sm-6'p>><'row'<'col-sm-12'tr>><'row'<'col-sm-6'i><'col-sm-6'p>>",
    'columnDefs': [
      {
        'targets': 0,
        'render': function(data, type, row) {
          return moment(row['record_time'], "X").format("MM/DD/YYYY HH:mm:ss a");
        }
      },
      {
        'targets': 1,
        'render': function (data, type, row) {
          return row['user'] + '<small class="secondary"> (' + row['userid'] + ')</small>';
        }
      },
      {
        'targets': 2,
        'data': 'xid'
      },
      {
        'targets': 3,
        'data': 'query'
      }
    ]
  });

  function init_datrange() {
    var start  = moment($('.daterange input[name="start_date"]').val());
    var end    = moment($('.daterange input[name="end_date"]').val());
    var oldest = moment($('.daterange input[name="oldest_date"]').val());
    var max_range = parseInt($('.daterange input[name="max_range"]').val());
    var ranges = {
      'Today': [moment(), moment()],
      'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
      'Last 7 Days': [moment().subtract(7, 'days'), moment()]
    };
    ranges['Last ' + max_range + ' Days (All)'] = [oldest, moment()];

    function cb(start, end) {
        $('.daterange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    }

    $('.daterange').daterangepicker({
        startDate: start,
        endDate: end,
        minDate: oldest,
        maxDate: moment(),
        opens: 'left',
        'dateLimit': {
          'days': max_range,
        },
        'linkedCalendars': false,
        ranges: ranges,
    }, cb);
    $('.daterange').on('apply.daterangepicker', function(ev, picker) {
      var start_date = picker.startDate.format('YYYY-MM-DD');
      var end_date   = picker.endDate.format('YYYY-MM-DD');
      window.location = '?start_date=' + start_date + '&end_date=' + end_date + '&selects=' + $('input[name="selects"]').val();
    });
    cb(start, end);
  }
  init_datrange();
});
