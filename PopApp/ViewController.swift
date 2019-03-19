//
//  ViewController.swift
//  PopApp
//
//  Created by Aldair Luna on 2/19/19.
//  Copyright © 2019 Aldair Luna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController,
        let barcodeViewController =
        navigationController.topViewController as? BarcodeViewController {
        barcodeViewController.delegate = self }
    }
    

    
    
    
    
    
    
}

extension ViewController:BarcodeViewControllerDelegate {
    func foundBarcode(barcode:String) {
    
    }
}
