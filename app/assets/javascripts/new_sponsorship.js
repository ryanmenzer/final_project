function Sponsorship(){
  this.people = [];
  this.projects = [];
  this.sponsors = [];
}




$(document).ready(function(){


  var sponsorship = new Sponsorship();

  $('#spon-add-receivers input').on('ifChecked', function(event){
    var id = $(this).attr('id')
    console.log(id);
    sponsorship.people.push(id);
    console.log(sponsorship);
  });

  $('#spon-add-receivers input').on('ifUnchecked', function(event){
    var id = $(this).attr('id')
    console.log(id);
    sponsorship.people.splice( $.inArray(id, sponsorship.people), 1 );
    console.log(sponsorship);
  });


});
