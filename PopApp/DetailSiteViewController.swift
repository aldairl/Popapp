//
//  DetailSiteViewController.swift
//  PopApp
//
//  Created by thinking on 3/4/19.
//  Copyright © 2019 Aldair Luna. All rights reserved.
//

import UIKit

class DetailSiteViewController: UIViewController, URLSessionDelegate {

    @IBOutlet weak var detalleSite: UILabel!
    @IBOutlet weak var siteImagen: UIImageView!
    @IBOutlet weak var titleSite: UILabel!
    
    @IBOutlet weak var imgServer: UIImageView!
    
    var titleS = String()
    var descriptionsit = String()
    var img = UIImage()
    var locationSite = String()
    
    
    var delegate: SiteViewControllerDelegate?
    //var delegateBarcode: BarcodeViewControllerDelegate?
    
    let urlServidor = "https://raw.githubusercontent.com/aldairl/Popapp/master/lugareserver-2.json"
    
    lazy var session:URLSession = {
        return URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detalleSite.text = descriptionsit
        titleSite.text = titleS
        siteImagen.image = img

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func verMas(_ sender: UIButton) {
        let comparar:String = titleSite.text!
        infoSitio(titulo: comparar)
    }
    
    @IBAction func addFavorite(_ sender: UIButton) {
        let siteToSave = Site(title: titleSite.text!,
                              des: detalleSite.text!
        )
        
        delegate?.saveSite(siteToSave)
        //dismiss(animated: true, completion: nil)
    }
    
    func infoSitio(titulo: String){
        let url:URL = URL(string: urlServidor)!
        session.dataTask(with: url){(data,response,err) in
            guard let data = data else{
                print("Datos nulos")
                return
            }
            do{
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:[Any]] else {
                    print("No se pudo convertir a json")
                    return
                }
                let verData = json["LUGARES"] as? [[String:String]]
                
                var encontrado:Bool = false
                for item in verData! {
                    
                    let cadena = item["NAME"]
                    
                    if (cadena!.elementsEqual(titulo) == true){
                        encontrado = true
                        self.detalleSite.text! = item["DESCRIPTION"]!
                        self.locationSite = item["LOCATION"]!
                        //print(self.locationSite.split(separator: ",")[0])
                        let imagenLink = item["IMAGE"]
                        self.cargarImagen(thumbnailURL: imagenLink!)
                        
                    }
                else{
                    }
            }
                if encontrado {
                    print("sitio encontrado")
                }else{
                    print("no se encuentra el sitio")
                }
            }catch let jsonError{
            print("error en la serializaciòn",jsonError)
        }
    }.resume()
    }

    func cargarImagen(thumbnailURL:String) {
        guard let url = URL(string: thumbnailURL) else {return}
        let task = session.downloadTask(with: url) { (tempURL, response, error) in
            if let tempURL = tempURL, let data = try? Data(contentsOf: tempURL),
                let image = UIImage(data: data) {
                self.siteImagen.image = image
                print("Soy la imagen")
            }
        }
        task.resume()
    }
    
    
<<<<<<< HEAD
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
=======
   
>>>>>>> f2409e4db0517a08c5af025028e4473a2328f254
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mapDes = segue.destination as? MapViewController{
            mapDes.titleSite = titleSite.text!
            mapDes.lat = String(locationSite.split(separator: ",")[0])
            mapDes.long = String(locationSite.split(separator: ",")[1])
        }
    }
<<<<<<< HEAD
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController,
            let barcodeViewController = navigationController.topViewController as? BarcodeViewController {
            barcodeViewController.delegate = self
        }
    }*/
=======
    
>>>>>>> f2409e4db0517a08c5af025028e4473a2328f254

}

extension DetailSiteViewController: BarcodeViewControllerDelegate {
    func foundBarcode(barcode:String) {
        titleSite.text = barcode
        }
}

protocol SiteViewControllerDelegate {
    func saveSite(_ site: Site)
}
