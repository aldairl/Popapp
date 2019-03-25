import UIKit

struct Site {
    static let defaultCover = UIImage(named: "Site.jpg")!
    var title:String
    var cover:UIImage {
        get {
            return image ?? Site.defaultCover
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
            return image ?? Site.defaultCover
        }
        
    }
}

