$(function() {
  $('form.delete').submit(function(e) {
    e.preventDefault();
    $.post(this.action, $(this).serialize(), removeMarketEntry($(this)))
    .fail(failHandler);
    return false;
  });

  var removeMarketEntry = function(context){
    context.parents('tr.market_entry').hide('slow', function(){ this.remove(); });
  };

  var failHandler = function(data){
    if(console && console.log)
      console.log(data);
  };
});
