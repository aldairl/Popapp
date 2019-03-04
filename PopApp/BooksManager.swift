import Foundation
import UIKit

class BooksManager {
    private lazy var books:[Book] = self.loadBooks()
    var bookCount:Int {return books.count}
    
    var OtroCover: [UIImage] = [UIImage(named: "astro.png")!, UIImage(named: "palet.png")! ]
    
    func getBook(at index:Int)->Book {
        return books[index] }
    
    private func loadBooks()->[Book] { return sampleBooks()
    }
    
    func addBook(_ book:Book) {
        books.append(book) }
    
    private func sampleBooks()->[Book] { return [
        Book(title: "Parques", cover: OtroCover[0]),
        Book(title: "Iglesias", cover: OtroCover[1]),
        Book(title: "Sitios Historicos"),
        Book(title: "Museos")
        ] }
}

//More books
