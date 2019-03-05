//
//  DetailSiteViewController.swift
//  PopApp
//
//  Created by thinking on 3/4/19.
//  Copyright © 2019 Aldair Luna. All rights reserved.
//

import UIKit

class DetailSiteViewController: UIViewController {

    @IBOutlet weak var siteImagen: UIImageView!
    @IBOutlet weak var descriptionSite: UILabel!
    
    var descriptionsit = String()
    var img = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionSite.text = descriptionsit
        
        siteImagen.image = img

        // Do any additional setup after loading the view.
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
