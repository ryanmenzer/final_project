function renderResults(response){
  var resultHtml = ""
  $.each(response, function(i, row){

    resultHtml = resultHtml + '<a href="' + row.url + '"><li style="border-bottom:1px solid gray">' 
    
    for(var attr in row._highlightResult){
        resultHtml = resultHtml +  "<span>" + this._highlightResult[attr].value.replace(/<em>/g,"<b>").replace(/<\/em>/g, "</b>") + "</span><br>"
    }

    resultHtml = resultHtml + '<em>' + row.tablename + '</em>' + '</li></a><br>'

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
