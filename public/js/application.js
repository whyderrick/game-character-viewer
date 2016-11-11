$(document).ready(function() {
  console.log("Ready");
  getExternalData();
});

var getExternalData = function() {
  $(".external-request").on("submit", function(e){
    e.preventDefault();
    var form = this;
    var method = $(form).attr("method");
    var data = $(form).serialize()
    console.log(data)
    var url = $(form).attr("action");
    $.ajax({
      url: url,
      method: method,
      data: data
    })
    .done( function( msg ) {
      console.log( msg )
    } )

  });
};
