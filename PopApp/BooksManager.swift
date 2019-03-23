import Foundation
import UIKit

class BooksManager {
    
    private lazy var books:[Book] = self.loadBooks(lista: 0)
    
    var bookCount:Int {return books.count}
    
    var OtroCover: [UIImage] = [UIImage(named: "astro.png")!, UIImage(named: "palet.png")!]
    
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
        Book(title: "Parques"),
        Book(title: "Iglesias")
        ] }
    
    private func nothing()->[Book] { return [
        
        ] }
    
    private func museos()->[Book] { return [
        Book(title: "Casa museo Guillermo León Valencia", cover: OtroCover[0]),
        Book(title: "Panteón de los Próceres", cover: OtroCover[1]),
        Book(title: "Museo casa Mosquera"),
        Book(title: "Museo Arquidiocesano de Arte religioso"),
        Book(title: "Museo Casa Negret")
        ] }
    private func sitiosHistoricos()->[Book] { return [
        Book(title: "Puente del Humilladero", cover: OtroCover[0]),
        Book(title: "Morro de Tulcán", cover: OtroCover[1]),
        Book(title: "Las tres cruces"),
        Book(title: "Pueblito Patojo"),
        Book(title: "Torre del reloj")
        ] }
    
    private func parques()->[Book] { return [
        Book(title: "Parque Caldas", cover: OtroCover[0]),
        Book(title: "Parque Carlos Albán", cover: OtroCover[1]),
        Book(title: "Parque Benito Juarez"),
        Book(title: "Parque Natural Puracé"),
        ] }
    
    private func iglesias()->[Book] { return [
        Book(title: "Iglesia Catedral", cover: OtroCover[0]),
        Book(title: "Iglesia Ermita", cover: OtroCover[1]),
        Book(title: "Iglesia San Francisco"),
        Book(title: "Iglesia Santo Domingo")
        ] }
    
    
}

//More books
