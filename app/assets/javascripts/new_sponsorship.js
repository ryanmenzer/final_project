function Sponsorship(){
  this.people = [];
  this.projects = [];
  this.sponsors = [];
}

var sponsorship = new Sponsorship();



$(document).ready(function(){

 $('#spon-add-receivers input').on('ifChecked', function(event){
  var id = $(this).attr('id')
  console.log(id);
  sponsorship.people.push({"person": id});
  console.log(sponsorship);
 });


});
