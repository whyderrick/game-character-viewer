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
    var url = $(form).attr("action");
    $.ajax({
      url: url,
      method: method,
      data: data
    })
    .done( function( msg ) {
      $( "#result" ).html( msg )
    } )
  });
};

// var addGame = function() {
//   $("#result").on("submit", "#add-game", function(e){
//     e.preventDefault();
//     e.stopPropagation();
//     var form = this
//     var url = $(form).attr("action")
//     var method = $(form).attr("method")
//     var data = $(form).serialize()
//     // Might be on track to double post.
//     $.ajax({
//       url: url,
//       method: method,
//       data:  data
//     })

//   })
// }
