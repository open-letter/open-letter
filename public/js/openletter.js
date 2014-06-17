$("#postcode").keyup(function(e) {

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
    $.ajax({
        type: 'POST',
        url: '/letters',
        data: $('#letter-form').serialize(),
        success: function( data ) {
            window.location.href='thanks.html';
        },
        error: function() {
          // TODO: handle errors
        }
    });
    event.preventDefault();
})


$('[data-toggle="tooltip"]').tooltip({'placement': 'bottom'});

var party = {"AG":"Australian Greens","LP":"Liberal Party of Australia","ALP":"Australian Labor Party", "Nats":"The Nationals", "PUP":"Palmer United Party", "LNP":"Liberal National Party"};

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
    "unanswered":"11%",
    "response": "89%",
    "letters": "328"}
};

function updateMP(pc) {

  $.ajax({
  type: 'GET',
  // url: 'data/' + pc + '.json',
  url: '/representatives/postcode/' + pc,
  contentType: 'text/plain',
  xhrFields: {withCredentials: false},
  headers: {},

  success: function( data ) {
    data = data[0];
    // TODO: add handling multiple results
    var electorate = data.electorate.name;
    var ministerName = [data.profile.title,data.profile.first_name,
      data.profile.last_name,data.honorific].join(" ");
    var ministerPreferred = data.profile.preferred_name;

    console.log(data.party);

    var ministerParty = party[data.party];
    if(ministerPreferred == '') ministerPreferred = data.profile.first_name;

    console.log(electorate, ministerPreferred, ministerName, ministerParty);

    $("#mp-name").text(ministerName);
    $("#mp-party").text(" \u2014 " + ministerParty);
    $("#mp-electorate").text(electorate);
    $(".mp-preferred-name").text(ministerPreferred);

    $("#representative-id").val(data.id);

    if(electorate in stats)
    {
      var s = stats[electorate];
      $("#stat-response").text(s.response);
      $("#stat-letters").text(s.letters);



      $("#satisfied").width(s.satisfied);
      $("#indifferent").width(s.indifferent);
      $("#unsatisfied").width(s.unsatisfied);
      $("#unanswered").width(s.unanswered);

      $("#satisfied").attr('data-original-title', s.satisfied + " Satisfied").tooltip('fixTitle');
      $("#indifferent").attr('data-original-title', s.indifferent + " Indifferent").tooltip('fixTitle');
      $("#unsatisfied").attr('data-original-title', s.unsatisfied + " Unsatisfied").tooltip('fixTitle');
      $("#unanswered").attr('data-original-title', s.unanswered + " Unanswered").tooltip('fixTitle');
    }
    // var src = "images/reps/" + ministerParty + ".jpg";
    // $("#mp-image").attr("src", src);
    // var src = "images/reps/" + electorate + ".jpg";
      var src = "images/reps2/" + data.profile.profile_img;
      $("#mp-image").attr("src", src);
  },

  error: function() {
    // Here's where you handle an error response.
    // Note that if the error was due to a CORS issue,
    // this function will still fire, but there won't be any additional
    // information about the error.
  }
});
}
