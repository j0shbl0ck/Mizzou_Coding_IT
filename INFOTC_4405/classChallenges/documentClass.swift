// Josh Block
// INFOTC 4405
// 09.08.2022

// make a class called Document and has the following properties: title, body, length
class Document {
    //  title is of type String and it is not an optional. When it is declared it is not set to an initial value. 
    var title: String
    // body is of type String. It is not an optional and is set to an empty string (“”) when it is declared.
    var body: String = ""
    // length is a computed property of type Int. The length property has only a getter that returns the number of characters in the body string. 
    var length: Int {
        get {
            return body.count
        }
    }
    // create initializer to recieve only the title
    init(title: String) {
        self.title = title
    }
    // create initializer to recieve both the title and body
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}


let document1 = Document(title: "Hello World")
document1.title = "Hello World!"
document1.body = "I awoke from a digital slumber."
let document2 = Document(title: "The Day", body: "It was a day to remember.")
print(document1.title)
print(document1.body)
print(document1.length)
print(document2.title)
print(document2.length)