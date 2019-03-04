import UIKit

struct Book {
    static let defaultCover = UIImage(named: "book.jpg")!
    var title:String
    var cover:UIImage {
        get {
            return image ?? Book.defaultCover
        } set {
            image = newValue }
    }
    private var image:UIImage? = nil
    init(title:String, cover:UIImage? = nil) {
        self.title = title
        self.image = cover
    } }

