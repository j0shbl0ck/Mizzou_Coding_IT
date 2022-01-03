var apiKey = "vkkAdzj75hbvo5RwcA70O2IMy6ens0R4hIOeoYtU";
var spiritManifest;

function getManifests() {            
    var xmlHttp = new XMLHttpRequest();
    
    xmlHttp.onload = function() {
        if (xmlHttp.status == 200) {
            spiritManifest = JSON.parse(xmlHttp.responseText).photo_manifest;
            
            var updatedPhotos = {};
            spiritManifest.photos.forEach(photo => {
                updatedPhotos[photo.sol] = photo;
            });

            spiritManifest.photos = updatedPhotos;
            console.log(spiritManifest);
        }
    };
    
    xmlHttp.open("GET", "https://api.nasa.gov/mars-photos/api/v1/manifests/spirit?api_key=" + apiKey, true);
    xmlHttp.send();
}
/* MODAL STUFF */

// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

/* END OF MODAL STUFF */

function changeSol() {
    var solVal = document.getElementById("sol").value;
    if (spiritManifest.photos[solVal] == null) {
        alert("No data for this sol");
        return;
    }

    var cameras = spiritManifest.photos[solVal].cameras;
    var selectString = "";
    cameras.forEach(cam => {
        selectString += "<option value='" + cam + "'>" + cam + "</option>";
    });

    document.getElementById("cameraSelect").innerHTML = selectString;
}

function submitInfo() {
    var xmlHttp = new XMLHttpRequest();

    xmlHttp.onload = function() {
        if (xmlHttp.status == 200) {
            response = JSON.parse(xmlHttp.responseText);
            var photo = response.photos[0];
            document.getElementById("displayImage").setAttribute("src", photo.img_src);
            document.getElementById("rover").innerHTML = "Rover: " + photo.rover.name;
            document.getElementById("camName").innerHTML = "Camera: " + photo.camera.full_name;
            document.getElementById("launch").innerHTML = "Launch Date: " + photo.rover.launch_date;
            
        }
    };

    var sol = document.getElementById("sol").value;
    var camera = document.getElementById("cameraSelect").value;

    var url = "https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?sol=" + sol + "&camera=" + camera + "&api_key=" + apiKey;
    /* Change url part "curiosity" to right one" */
    xmlHttp.open("GET", url, true);
    xmlHttp.send();
}

$('#getDataBtn').click(function () {

    // On click, execute the ajax call.
    $.ajax({
        type: "GET",
        url: url,
        dataType: 'json',
        beforeSend: function () { // Removes the .hidden class from the spinner and default to inline-block.
            $('#loader').removeClass('hidden')
        },
        complete: function () { // Set our complete callback, adding the .hidden class and hiding the spinner.
            $('#loader').addClass('hidden')
        },
    });
});