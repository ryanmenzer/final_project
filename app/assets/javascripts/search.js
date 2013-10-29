function renderResults(response){

  var icons = { people: "icon-user", initiatives: "icon-bullhorn", groups: "icon-group", projects: "icon-tasks"  }

  var resultHtml = "<ul class='box-list'>"
  $.each(response, function(i, row){

    resultHtml = resultHtml + ('<li><a href="' + row.url + '"><div><i class="'+icons[row.tablename]+' icon-2x"></i></div><div>')

    for(var attr in row._highlightResult){
        resultHtml = resultHtml +  "<p class='" + attr + "'>" + this._highlightResult[attr].value.replace(/<em>/g,"<b>").replace(/<\/em>/g, "</b>") + "</p>"
    }

    resultHtml = resultHtml + '</div></a></li>'

  });
  resultHtml = resultHtml + "</ul>"
  return resultHtml
}

$(document).ready(function(){

  $("#search-field").on("blur", function(){
    setTimeout(function(){$('#search-result').hide()},150)
  })

  $(document).on("keyup", "#search-field", function(){
    searchQuery = $("#search-field").val();
    var data = {query: searchQuery};
    if( !this.value ) {
      $('#search-result').html("");
      $('#search-result').hide();
    } else {
      $.post('/search', data, function(response){
        var results = renderResults(response)
        $('#search-result').html("")
        if(results.length > 30) {
          $('#search-result').show();
          $('#search-result').html(renderResults(response));
        } else {
          $('#search-result').hide();
        }
      });
    }

  });

});
