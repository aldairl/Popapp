import Foundation
import UIKit

class BooksManager {
    
    private lazy var books:[Book] = self.loadBooks(lista: 0)
    
    var bookCount:Int {return books.count}
    
    var OtroCover: [UIImage] = [UIImage(named: "museos.png")!, UIImage(named: "sitiosHistoricos.png")!, UIImage(named: "parques.png")!, UIImage(named: "iglesias.png")!]
    
    func getBook(at index:Int)->Book {
        return books[index] }
    
    func loadBooks(lista: Int)->[Book] {
        if (lista == 0){
           return sampleBooks()
        }
        
        if (lista == 1){
            return museos()
        }
        
        if (lista == 2){
            return sitiosHistoricos()
        }
        
        if (lista == 3){
            return parques()
        }
        
        if (lista == 4){
            return iglesias()
        }
        
      return nothing()
    }
    
    func addBook(_ book:Book) {
        books.append(book) }
    
    
    
    private func sampleBooks()->[Book] { return [
        Book(title: "Museos", cover: OtroCover[0]),
        Book(title: "Sitios Historicos", cover: OtroCover[1]),
        Book(title: "Parques", cover: OtroCover[2]),
        Book(title: "Iglesias", cover: OtroCover[3])
        ] }
    
    private func nothing()->[Book] { return [
        
        ] }
    
    private func museos()->[Book] { return [
        Book(title: "Casa museo Guillermo León Valencia", cover: OtroCover[0]),
        Book(title: "Panteón de los Próceres", cover: OtroCover[0]),
        Book(title: "Museo casa Mosquera", cover: OtroCover[0]),
        Book(title: "Museo Arquidiocesano de Arte religioso", cover: OtroCover[0]),
        Book(title: "Museo Casa Negret", cover: OtroCover[0])
        ] }
    private func sitiosHistoricos()->[Book] { return [
        Book(title: "Puente del Humilladero", cover: OtroCover[1]),
        Book(title: "Morro de Tulcán", cover: OtroCover[1]),
        Book(title: "Las tres cruces", cover: OtroCover[1]),
        Book(title: "Pueblito Patojo", cover: OtroCover[1]),
        Book(title: "Torre del reloj", cover: OtroCover[1])
        ] }
    
    private func parques()->[Book] { return [
        Book(title: "Parque Caldas", cover: OtroCover[2]),
        Book(title: "Parque Carlos Albán", cover: OtroCover[2]),
        Book(title: "Parque Benito Juarez", cover: OtroCover[2]),
        Book(title: "Parque Natural Puracé", cover: OtroCover[2]),
        ] }
    
    private func iglesias()->[Book] { return [
        Book(title: "Iglesia Catedral", cover: OtroCover[3]),
        Book(title: "Iglesia Ermita", cover: OtroCover[3]),
        Book(title: "Iglesia San Francisco", cover: OtroCover[3]),
        Book(title: "Iglesia Santo Domingo", cover: OtroCover[3])
        ] }
    
    
}

//More books
