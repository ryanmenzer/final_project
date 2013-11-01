function Sponsorship(){
  this.people = [];
  this.projects = [];
  this.sponsors = [];
}

$(document).ready(function(){

  var sponsorship = new Sponsorship();

  $('#spon-add-receivers input').on('ifChecked', function(event){
    var id = $(this).attr('id')
    sponsorship.people.push(id);
    $('p.people').html(sponsorship.people.length);
  });

  $('#spon-add-receivers input').on('ifUnchecked', function(event){
    var id = $(this).attr('id')
    sponsorship.people.splice( $.inArray(id, sponsorship.people), 1 );
    $('p.people').html(sponsorship.people.length);
  });

  $('#spon-add-projects input').on('ifChecked', function(event){
    var id = $(this).attr('id')
    sponsorship.projects.push(id);
    $('p.projects').html(sponsorship.projects.length);
  });

  $('#spon-add-projects input').on('ifUnchecked', function(event){
    var id = $(this).attr('id')
    sponsorship.projects.splice( $.inArray(id, sponsorship.projects), 1 );
    $('p.projects').html(sponsorship.projects.length);
  });

    $('#spon-add-sponsors input').on('ifChecked', function(event){
    var id = $(this).attr('id')
    sponsorship.sponsors.push(id);
    $('p.sponsors').html(sponsorship.sponsors.length);
  });

  $('#spon-add-sponsors input').on('ifUnchecked', function(event){
    var id = $(this).attr('id')
    sponsorship.sponsors.splice( $.inArray(id, sponsorship.sponsors), 1 );
    $('p.sponsors').html(sponsorship.sponsors.length);
  });

  $('#spon-add-receivers #people-projects').on('click', function(){
    $('#spon-add-receivers').modal('hide')
    $('#spon-add-projects').modal('show')
  });

  $('#spon-add-projects #projects-people').on('click', function(){
    $('#spon-add-projects').modal('hide')
    $('#spon-add-receivers').modal('show')
  });

  $('#spon-add-projects #projects-sponsors').on('click', function(){
    $('#spon-add-projects').modal('hide')
    $('#spon-add-sponsors').modal('show')
  });

  $('#spon-add-sponsors #sponsors-projects').on('click', function(){
    $('#spon-add-sponsors').modal('hide')
    $('#spon-add-projects').modal('show')
  });

  $('#spon-add-sponsors #submit-initative').on('click', function(){
    $.post("/sponsorship/create")
  });

});
