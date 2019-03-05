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
    }
    
    func gettitle()-> String{
        return title
    }
    
    //repara el dsempaquetado de la imagen, porque la aplicacion
    //se cae cuando se le da clic en ina lista que no tiene imagen
    func getimg()->UIImage {
        if image != nil{
            return image!
        }else{
            return image ?? Book.defaultCover
        }
        
    }
}

