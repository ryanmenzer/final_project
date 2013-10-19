function log(obj) {
    $('#response').text(JSON.stringify(obj));
}

// create a new instance of the Mandrill class with your API key
// The app won't work until you put in API key below
var m = new mandrill.Mandrill('luDyP0TvxOc6zdmbEsaP8Q');

// create a variable for the API call parameters
var params = {
    "message": {
        "from_email":"titipongpisit2013@gmail.com",
        "to":[{"email":"titipongpisit@hotmail.com"}],
        "subject": "Sending a text email from the Mandrill API(1)",
        "text": "Send email using a form."
    }
};

function sendTheMail() {
// Send the email!

    m.messages.send(params, function(res) {
        console.log(res);
        var url = '/emailresponses'
        // var data = res
        $.post(url, data);
        // $.get();
        // alert(res)
    }, function(err) {
        log(err);
    });
}


$(document).ready(function() {
    console.log('ready');
  $('#email').submit(function(event){
    console.log("we target the right thing.")
    alert("Hey");
    event.preventDefault();
    // console.log('click' );
    // console.log(res);
    sendTheMail();
  });
});