function log(obj) {
    $('#response').text(JSON.stringify(obj));
}

// create a new instance of the Mandrill class with your API key
// The app won't work until you put in API key below
var m = new mandrill.Mandrill('put your api key here');

// create a variable for the API call parameters
var params = {
    "message": {
        "from_email":"titipongpisit2013@gmail.com",
        "to":[{"email":"titipongpisit@hotmail.com"}],
        "subject": "Sending a text email from the Mandrill API",
        "text": "We can now send an email form our app"
    }
};

function sendTheMail() {
// Send the email!

    m.messages.send(params, function(res) {
        log(res);
    }, function(err) {
        log(err);
    });
}


$(document).ready(function() {
    console.log('ready');
  $('#email').click(function(event){
    event.preventDefault();
    console.log('click' );
    sendTheMail();
  });
});