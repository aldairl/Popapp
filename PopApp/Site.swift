import UIKit

internal struct key {
    static let title = "title"
    static let desSite = "desSite"
    
}

struct Site {
    static let defaultImage = UIImage(named: "siteDefault.jpg")!
    var title:String
    var desSite:String
    var id:Int
    private var image:UIImage? = nil
    var cover:UIImage {
        get {
            return image ?? Site.defaultImage
        } set {
            image = newValue
            
        }
    }
    
    
    init(title:String, des:String, cover:UIImage? = nil, id:Int? = nil) {
        self.title = title
        self.desSite = des
        self.image = cover
        self.id = id ?? -1
    }
    
    init?(rs:FMResultSet) {
        let idDB = rs.int(forColumn: "ROWID")
        guard let title = rs.string(forColumn: key.title),
        let desSite = rs.string(forColumn: key.desSite)
        else {return nil }
        
        self.init(title:title,
                  des:desSite,
                  id: Int(idDB)  )
    }
    
    //repara el dsempaquetado de la imagen, porque la aplicacion
    //se cae cuando se le da clic en una lista que no tiene imagen
    func getimg()->UIImage {
        if image != nil{
            return image!
        }else{
            return image ?? Site.defaultImage
        }
        
    }


}
