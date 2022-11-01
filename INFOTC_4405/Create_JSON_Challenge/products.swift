struct Product : Identifiable {
    let id = UUID()
    let cost: Double
    let name: String
    let urlString: String
}

var products = [Product(cost: 1999, name: "MacBook Pro 14in", urlString: "https://www.apple.com/macbook-pro/"),
                Product(cost: 1299, name: "MacBook Pro 13in", urlString: "https://www.apple.com/macbook-pro-13/"),
                Product(cost: 999, name: "iPhone 13 Pro", urlString: "https://www.apple.com/iphone-13-pro/"),
                Product(cost: 449, name: "Apple Watch Series 7", urlString: "https://www.apple.com/shop/buy-watch/apple-watch"),
                Product(cost: 179, name: "Airpods 3rd Generation", urlString: "https://www.apple.com/airpods-3rd-generation/"),
                Product(cost: 199, name: "Apple TV 4K 64 GB", urlString: "https://www.apple.com/apple-tv-4k/"),
                Product(cost: 1299, name: "iMac 24 inch", urlString: "https://www.apple.com/imac-24/"),
                Product(cost: 699, name: "Mac mini 256 GB", urlString: "https://www.apple.com/shop/buy-mac/mac-mini")]