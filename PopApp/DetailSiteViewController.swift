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
    @IBOutlet weak var descriptionSite: UILabel!
    
    @IBOutlet weak var imgServer: UIImageView!
    
    var descriptionsit = String()
    var img = UIImage()
    
    let urlServidor = "https://raw.githubusercontent.com/aldairl/Popapp/master/lugareserver-2.json"
    lazy var session:URLSession = {
        return URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionSite.text = descriptionsit
        
        siteImagen.image = img

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func verMas(_ sender: UIButton) {
        let comparar:String = descriptionSite.text!
        infoSitio(titulo: comparar)
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
                for item in verData! {
                    let cadena = item["NAME"]
                    let imagenLink = item["IMAGE"]
                    if (cadena!.elementsEqual(titulo) == true){
                        self.detalleSite.text! = item["DESCRIPTION"]!
                        self.cargarImagen(thumbnailURL: imagenLink!)
                    }
                else{
                    print("No se encontrò la lista de sitios")
                }
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
