
$( "#postcode" ).keyup(function(e) {

  console.log( "Handler for .keypress() called." );

  var pc = $( "#postcode" ).val();
  
  if(e.which == 13 && $( "#postcode" ).val().length == 4) {
    console.log("Request MP details from backend");
    updateMP(pc);
    $('#rep').toggle(true);
    $('#thoughts').toggle(true);
    $('#rep')[0].scrollIntoView();
    $("#subject").focus();
  } else {
    $('#rep').toggle(false);
    $('#thoughts').toggle(false);
  };
  
});

// TODO modal for address details

$("#sendnow").click(function(){
   window.location.href='thanks.html';
})


$('[data-toggle="tooltip"]').tooltip({'placement': 'bottom'});

var party = {"AG":"Australian Greens","LP":"Liberal Party of Australia","ALP":"Australian Labor Party"};

var stats = {
  "Melbourne": {
    "satisfied":"51%",
    "indifferent":"14%",
    "unsatisfied":"17%",
    "unanswered":"18%",
    "response": "82%",
    "letters": "152"
  },
  "Warringah":{
    "satisfied":"26%",
    "indifferent":"5%",
    "unsatisfied":"58%",
    "unanswered":"11%"}
};

function updateMP(pc) {
  
  $.ajax({
  type: 'GET',
  // url: 'data/' + pc + '.json',
  url: 'http://openletter.cfapps.io/representative/postcode/' + pc,
  contentType: 'text/plain',
  xhrFields: {withCredentials: false},
  headers: {},

  success: function( data ) {
    var electorate = data.boundary.name;
    var ministerName = [data.profile.title,data.profile.first_name,data.profile.last_name,data.honorific].join(" ");
    var ministerPreferred = data.profile.preferred_name;
    var ministerParty = party[data.party];
    if(ministerPreferred == '') ministerPreferred = data.profile.first_name;
    
    console.log(electorate, ministerPreferred, ministerName, ministerParty);

    var src = "images/reps/" + electorate + ".jpg";
    $("#mp-image").attr("src", src);
    
    $("#mp-name").text(ministerName);
    $("#mp-party").text(" \u2014 " + ministerParty);
    $("#mp-electorate").text(electorate);
    $(".mp-preferred-name").text(ministerPreferred);

    var s = stats[electorate];
    $("#satisfied").width(s.satisfied);
    $("#indifferent").width(s.indifferent);
    $("#unsatisfied").width(s.unsatisfied);
    $("#unanswered").width(s.unanswered);
    
    $("#satisfied").attr('data-original-title', s.satisfied + " Satisfied").tooltip('fixTitle');
    $("#indifferent").attr('data-original-title', s.indifferent + " Indifferent").tooltip('fixTitle');
    $("#unsatisfied").attr('data-original-title', s.unsatisfied + " Unsatisfied").tooltip('fixTitle');
    $("#unanswered").attr('data-original-title', s.unanswered + " Unanswered").tooltip('fixTitle');
  },

  error: function() {
    // Here's where you handle an error response.
    // Note that if the error was due to a CORS issue,
    // this function will still fire, but there won't be any additional
    // information about the error.
  }
});
}