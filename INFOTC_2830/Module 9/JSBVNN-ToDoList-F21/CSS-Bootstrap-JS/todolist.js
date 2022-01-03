function addEventListener(){
    document.getElementById("addToList").addEventListner("submit",function (event){
        event.preventDefault();
    })
}

function createListItem(){
    var title = document.getElementById("title").value
    var tableRow = "<tr><td>" + title + "</td></tr>"
    document.getElementById("tableBody").innerHTML += tableRow
}

function myFunction() {
    var element = document.body;
    element.classList.toggle("dark");
  }

  $( ".button" ).on("click", function() {
    if( $( "body" ).hasClass( "dark" )) {
        $( "body" ).removeClass( "dark" );
        $( ".button" ).text( "OFF" );
    } else {
        $( "body" ).addClass( "dark" );
        $( ".button" ).text( "ON" );
    }
});