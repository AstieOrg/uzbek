var clndr = {};

$( function() {

  // PARDON ME while I do a little magic to keep these events relevant for the rest of time...
  var currentMonth = moment().format('YYYY-MM');
  var nextMonth    = moment().add('month', 1).format('YYYY-MM');

  var events = [
    { date: currentMonth + '-' + '10', title: 'Conference', location: 'at Jakarta' },
    { date: currentMonth + '-' + '19', title: 'Meeting', location: 'Indonesia' },
    { date: currentMonth + '-' + '23', title: 'Contoh Agenda', location: '' },
    { date: nextMonth + '-' + '07',    title: 'Contoh Agenda', location: '' }
  ];

  clndr = $('#full-clndr').clndr({
    template: $('#full-clndr-template').html(),
    events: events
  });

  $('#mini-clndr').clndr({
    template: $('#mini-clndr-template').html(),
    events: events,
    clickEvents: {
      click: function(target) {
        if(target.events.length) {
          var daysContainer = $('#mini-clndr').find('.days-container');
          daysContainer.toggleClass('show-events', true);
          $('#mini-clndr').find('.x-button').click( function() {
            daysContainer.toggleClass('show-events', false);
          });
        }
      }
    },
    adjacentDaysChangeMonth: true
  });

  $('#clndr-3').clndr({
    template: $('#clndr-3-template').html(),
    events: events,
    showAdjacentMonths: false
  });
});