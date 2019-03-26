//
//  BarcodeViewController.swift
//  PopApp
//
//  Created by Diana Sofia Quinonez Casas on 3/3/19.
//  Copyright © 2019 Aldair Luna. All rights reserved.
//

import UIKit
import AVFoundation

class BarcodeViewController: UIViewController {
    
    var delegate:BarcodeViewControllerDelegate?
    var captureSession: AVCaptureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    
    @IBOutlet weak var barcodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let cameraDevice = AVCaptureDevice.default(for: AVMediaType.video)
            else {
                failed()
                return
        }
        
        guard let videoInput = try? AVCaptureDeviceInput(device: cameraDevice)
        else {
            failed()
            return
        }
        
        //add video camera input to capture session
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)}
        else {
            failed();return}
        
        //Barcode detector
        let metadataOutput = AVCaptureMetadataOutput()
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput) } else {failed();return}
        // Customize metadata output
        metadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        
        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureSession.startRunning()
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.frame
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(previewLayer)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchBarcode(_ sender: UIButton) {
     // delegate?.foundBarcode(barcode: barcodeTextField.text!)
     // dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func failed() {
        let ac = UIAlertController(title: "Barcode detection not supported",
                                   message: "Your device doesn't support barcode detection.",
                                   preferredStyle: .alert)
        let alert = UIAlertAction(title: "OK", style: .default)/* { (action) in
         self.dismiss(animated: true, completion: nil)
         }*/
        ac.addAction(alert)
        present(ac, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let VerDetalle = segue.destination as? DetailSiteViewController {
          //  VerDetalle.delegateBarcode? = VerDetalle
            VerDetalle.titleS = barcodeTextField.text!
        }
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


protocol BarcodeViewControllerDelegate {
    func foundBarcode(barcode:String)
}

extension BarcodeViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection){
        if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
            captureSession.stopRunning()
            delegate?.foundBarcode(barcode:
            metadataObject.stringValue!)
            dismiss(animated: true, completion: nil)
            }
        }
    }
