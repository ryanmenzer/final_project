function push_growl(element){
  var title = $(element).find('#err-name').html();
  var text =  $(element).find('#err-msg').html();
  var type =  $(element).attr('class');

  switch(type)
  {
    case "error":
     Growl.error({title: title, text: text})
     break;
    case "warn":
      $Growl.warn({title: title, text: text})
      break;
    case "success":
      Growl.success({title: title, text: text})
      break;
    default:
      Growl.info({title: title, text: text})
      break;
  }
}


$(document).ready(function(){
  $("#flash-errors #message").each(function(i,message) {
    push_growl(message);
  });
});
