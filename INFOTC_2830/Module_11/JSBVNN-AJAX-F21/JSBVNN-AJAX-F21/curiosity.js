var apiKey = "vkkAdzj75hbvo5RwcA70O2IMy6ens0R4hIOeoYtU";
var curiosityManifest;

function getManifests() {            
    var xmlHttp = new XMLHttpRequest();
    
    xmlHttp.onload = function() {
        if (xmlHttp.status == 200) {
            curiosityManifest = JSON.parse(xmlHttp.responseText).photo_manifest;
            
            var updatedPhotos = {};
            curiosityManifest.photos.forEach(photo => {
                updatedPhotos[photo.sol] = photo;
            });

            curiosityManifest.photos = updatedPhotos;
            console.log(curiosityManifest);
        }
    };
    
    xmlHttp.open("GET", "https://api.nasa.gov/mars-photos/api/v1/manifests/curiosity?api_key=" + apiKey, true);
    xmlHttp.send();
}

function changeSol() {
    var solVal = document.getElementById("sol").value;
    if (curiosityManifest.photos[solVal] == null) {
        alert("No data for this sol");
        return;
    }

    var cameras = curiosityManifest.photos[solVal].cameras;
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
            document.getElementById("camName").innerHTML = "Rover: " + photo.rover.name;
            document.getElementById("launch").innerHTML = "Launch Date: " + photo.rover.launch_date;
            
        }
    };

    var sol = document.getElementById("sol").value;
    var camera = document.getElementById("cameraSelect").value;

    var url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=" + sol + "&camera=" + camera + "&api_key=" + apiKey;
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