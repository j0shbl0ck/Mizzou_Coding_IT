// Josh Block
// INFOTC 4405
// 09.08.2022

// create structure named TravelPhoto with properties named latitude, longitude, title, description, image, urlString. Properties are not changeable after they are set.
struct TravelPhoto {
    let latitude: Double
    let longitude: Double
    let title: String
    let description: String
    let image: String
    let urlString: String
}

// create an instance and assign it to a constant called photo1
let photo1 = TravelPhoto(latitude: 38.94733, longitude: -92.328466, title: "The Mizzou Columns", description: "University of Missouri six iconic columns", image: "columns.png", urlString: "http://missouri.edu/about/history/columns.php")
