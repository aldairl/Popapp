//
//  MapViewController.swift
//  PopApp
//
//  Created by thinking on 3/25/19.
//  Copyright © 2019 Aldair Luna. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    var latitude: CLLocationDegrees = 0
    var longitude: CLLocationDegrees = 0
    var titleSite = String()
    var lat = String()
    var long = String()

    @IBOutlet weak var locationMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.latitude = Double(lat)!
        self.longitude = Double(long)!
        
        let locationSite = CLLocationCoordinate2DMake(self.latitude, self.longitude )
       
        let annotation = MKPointAnnotation()
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: locationSite, span: span)
        
        annotation.coordinate = locationSite
        annotation.title = titleSite
        
        locationMap.setRegion(region, animated: true)
        locationMap.addAnnotation(annotation)
        
        print(latitude)
        print(longitude)
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
