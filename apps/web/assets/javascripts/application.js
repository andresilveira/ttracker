$(function() {
  $('form[data-confirm]').submit(function(e) {
    confirmMessage = $(this).data('confirm-message') || 'Are you sure?'
    if(!confirm(confirmMessage)){
      e.preventDefault();
    }
  });
});
