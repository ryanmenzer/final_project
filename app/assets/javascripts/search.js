function renderResults(response){
  var resultHtml = ""
  $.each(response, function(i, row){
    if (row.tablename === "initiatives")
    {
      resultHtml = resultHtml + '<a href="' + row.url + '"><li>'+ row.title + '</li></a>'
    }
    else if (row.tablename === "people")
    {
      resultHtml = resultHtml + '<a href="' + row.url + '"><li>'+ row.full_name + " " + row.email + '</li></a>'
    }
  });

  return resultHtml
}

$(document).ready(function(){

  $("#search-field").on("focus", function(){
    $('#search-result').show();
  })

  $("#search-field").on("blur", function(){
    $('#search-result').hide();
  })

  $(document).on("keyup", "#search-field", function(){
    searchQuery = $("#search-field").val();
    var data = {query: searchQuery};
    $.post('/search', data, function(response){
      $('#search-result').show();
      $('#search-result').html(renderResults(response));
    
    });
  
  });

});
