import Foundation
import UIKit

class SitesManager {
    
    private lazy var Sites:[Site] = self.loadSites(lista: 0)
    
    var SiteCount:Int {return Sites.count}
    
    var OtroCover: [UIImage] = [UIImage(named: "museos.png")!, UIImage(named: "sitiosHistoricos.png")!, UIImage(named: "parques.png")!, UIImage(named: "iglesias.png")!]
    
    func getSite(at index:Int)->Site {
        return Sites[index] }
    
    func loadSites(lista: Int)->[Site] {
        if (lista == 0){
           return sampleSites()
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
    
    func addSite(_ Site:Site) {
        Sites.append(Site) }
    
    
    
    private func sampleSites()->[Site] { return [
        Site(title: "Museos", cover: OtroCover[0]),
        Site(title: "Sitios Historicos", cover: OtroCover[1]),
        Site(title: "Parques", cover: OtroCover[2]),
        Site(title: "Iglesias", cover: OtroCover[3])
        ] }
    
    private func nothing()->[Site] { return [
        
        ] }
    
    private func museos()->[Site] { return [
        Site(title: "Casa museo Guillermo León Valencia", cover: OtroCover[0]),
        Site(title: "Panteón de los Próceres", cover: OtroCover[0]),
        Site(title: "Museo casa Mosquera", cover: OtroCover[0]),
        Site(title: "Museo Arquidiocesano de Arte religioso", cover: OtroCover[0]),
        Site(title: "Museo Casa Negret", cover: OtroCover[0])
        ] }
    private func sitiosHistoricos()->[Site] { return [
        Site(title: "Puente del Humilladero", cover: OtroCover[1]),
        Site(title: "Morro de Tulcán", cover: OtroCover[1]),
        Site(title: "Las tres cruces", cover: OtroCover[1]),
        Site(title: "Pueblito Patojo", cover: OtroCover[1]),
        Site(title: "Torre del reloj", cover: OtroCover[1])
        ] }
    
    private func parques()->[Site] { return [
        Site(title: "Parque Caldas", cover: OtroCover[2]),
        Site(title: "Parque Carlos Albán", cover: OtroCover[2]),
        Site(title: "Parque Benito Juarez", cover: OtroCover[2]),
        Site(title: "Parque Natural Puracé", cover: OtroCover[2]),
        ] }
    
    private func iglesias()->[Site] { return [
        Site(title: "Iglesia Catedral", cover: OtroCover[3]),
        Site(title: "Iglesia Ermita", cover: OtroCover[3]),
        Site(title: "Iglesia San Francisco", cover: OtroCover[3]),
        Site(title: "Iglesia Santo Domingo", cover: OtroCover[3])
        ] }
    
    
}

//More Sites
