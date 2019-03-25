import Foundation
import UIKit

//-----------------path for db--------------
private var appSupportDirectory:URL = {
    let url = FileManager().urls(for:.applicationSupportDirectory,in: .userDomainMask).first!
    if !FileManager().fileExists(atPath: url.path) {
        do {
            try FileManager().createDirectory(at: url,
                                              withIntermediateDirectories: false)
        } catch let error as NSError {
            print("\(error.localizedDescription)")
        }
    }
    return url
}()

private var sitesFile:URL = {
    let filePath = appSupportDirectory.appendingPathComponent("favorites").appendingPathExtension("db")
    print(filePath)
    if !FileManager().fileExists(atPath: filePath.path) {
        if let bundleFilePath = Bundle.main.resourceURL?.appendingPathComponent("favorites").appendingPathExtension("db") {
            do {
                try FileManager().copyItem(at: bundleFilePath, to: filePath)
            } catch let error as NSError {
                //fingers crossed
                print("\(error.localizedDescription)")
            }
        } }
    return filePath
}()

//class manager --------------------

class SitesManager {
    
    private lazy var sites:[Site] = self.loadSites()
    
    var siteCount:Int {return sites.count}
    
    var OtroCover: [UIImage] = [UIImage(named: "museos.png")!, UIImage(named: "sitiosHistoricos.png")!, UIImage(named: "parques.png")!, UIImage(named: "iglesias.png")!]
    
    func getSite(at index:Int)->Site {
        return sites[index] }
    
    func loadSites(lista: Int? = nil)->[Site] {
        //por defecto retorna lista de la base de datos
        if (lista == 0){
           return sampleSites()}
        
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
        
      return retrieveSites() ?? []
    }
    
    private func sampleSites()->[Site] { return [
        Site(title: "Museos",des:"", cover: OtroCover[0]),
        Site(title: "Sitios Historicos",des:"", cover: OtroCover[1]),
        Site(title: "Parques",des:"", cover: OtroCover[2]),
        Site(title: "Iglesias",des:"", cover: OtroCover[3])
        ] }
    private func museos()->[Site] { return [
        Site(title: "Casa museo Guillermo León Valencia",des:"", cover: OtroCover[0]),
        Site(title: "Panteón de los Próceres",des:"", cover: OtroCover[0]),
        Site(title: "Museo casa Mosquera",des:"", cover: OtroCover[0]),
        Site(title: "Museo Arquidiocesano de Arte religioso",des:"", cover: OtroCover[0]),
        Site(title: "Museo Casa Negret",des:"", cover: OtroCover[0])
        ] }
    private func sitiosHistoricos()->[Site] { return [
        Site(title: "Puente del Humilladero",des:"", cover: OtroCover[1]),
        Site(title: "Morro de Tulcán",des:"", cover: OtroCover[1]),
        Site(title: "Las tres cruces",des:"", cover: OtroCover[1]),
        Site(title: "Pueblito Patojo",des:"", cover: OtroCover[1]),
        Site(title: "Torre del reloj",des:"", cover: OtroCover[1])
        ] }
    
    private func parques()->[Site] { return [
        Site(title: "Parque Caldas",des:"", cover: OtroCover[2]),
        Site(title: "Parque Carlos Albán",des:"", cover: OtroCover[2]),
        Site(title: "Parque Benito Juarez",des:"", cover: OtroCover[2]),
        Site(title: "Parque Natural Puracé",des:"", cover: OtroCover[2]),
        ] }
    
    private func iglesias()->[Site] { return [
        Site(title: "Iglesia Catedral",des:"", cover: OtroCover[3]),
        Site(title: "Iglesia Ermita",des:"", cover: OtroCover[3]),
        Site(title: "Iglesia San Francisco",des:"", cover: OtroCover[3]),
        Site(title: "Iglesia Santo Domingo",des:"", cover: OtroCover[3])
        ] }
    
    
    func addSite(_ site:Site) {
        var siteg = site
        SQLAddSite(site: &siteg)
        sites.append(site) }
    
    //-------------SQL--------
    
    func getOpenDB()->FMDatabase? {
        let db = FMDatabase(path: sitesFile.path)
        guard db.open() else {
            print("Unable to open database")
            return nil
        }
        return db}
    
    func retrieveSites() -> [Site]?{
        guard let db = getOpenDB() else{return nil}
        var sites:[Site]=[]
        
        do{
            let rs = try db.executeQuery("SELECT * FROM site", values:nil)
            
            while rs.next(){
                if let sitedb = Site(rs: rs){
                    sites.append(sitedb)}
            }
        }catch {
            print("failed: \(error.localizedDescription)")
        }
        db.close()
        return sites}
    
    func SQLAddSite(site:inout Site){
        guard  let db = getOpenDB() else { return}
        
        do{
            try db.executeUpdate("insert into site (title, desSite, cover) values (?, ?, ?)", values: [site.title, site.desSite, site.cover])
        }catch{
            
            print("failed: \(error.localizedDescription)")
        }
        db.close() }
    
    
}

//More Sites
