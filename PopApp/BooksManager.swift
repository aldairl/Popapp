import Foundation
import UIKit

class BooksManager {
    
    private lazy var books:[Book] = self.loadBooks(lista: 0)
    
    var bookCount:Int {return books.count}
    
    var OtroCover: [UIImage] = [UIImage(named: "astro.png")!, UIImage(named: "palet.png")! ]
    
    func getBook(at index:Int)->Book {
        return books[index] }
    
    func loadBooks(lista: Int)->[Book] {
        if (lista == 0){
            return sampleBooks()
        }
        
        if (lista == 1){
            return parques()
        }
        
        if (lista == 2){
            return iglesias()
        }
        
        return sampleBooks()
    }
    
    func addBook(_ book:Book) {
        books.append(book) }
    
    private func sampleBooks()->[Book] { return [
        Book(title: "Parques", cover: OtroCover[0]),
        Book(title: "Iglesias", cover: OtroCover[1]),
        Book(title: "Sitios Historicos"),
        Book(title: "Museos")
        ] }
    
    private func parques()->[Book] { return [
        Book(title: "Casa museo Guillermo León Valencia", cover: OtroCover[0]),
        Book(title: "Panteón de los Próceres", cover: OtroCover[1]),
        Book(title: "Museo casa Mosquera"),
        Book(title: "parque4")
        ] }
    
    private func iglesias()->[Book] { return [
        Book(title: "iglesia1", cover: OtroCover[0]),
        Book(title: "iglesia2", cover: OtroCover[1]),
        Book(title: "iglesia3"),
        Book(title: "iglesia4")
        ] }
    
    
}

//More books
