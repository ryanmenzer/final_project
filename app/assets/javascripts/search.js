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

  $("#search-field").on("focus", function(){
    $('#search-result').show();
  })

  // $("#search-field").on("blur", function(){
  //   $('#search-result').hide();
  // })

  $(document).on("keyup", "#search-field", function(){
    searchQuery = $("#search-field").val();
    var data = {query: searchQuery};
    $.post('/search', data, function(response){
      // console.log($('#search-result'));
      $('#search-result').html("")
      $('#search-result').show();
      console.log(renderResults(response));
      $('#search-result').html(renderResults(response));
    });

  });

});
