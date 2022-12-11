//
//  QrCodeScannerViewController.swift
//  e-Constat
//
//  Created by MacBook Pro on 10/12/2022.
//

import UIKit
import AVFoundation
import SwiftUI

class QrCodeScannerViewController: UIViewController {
    var userB : User?
    var CarB : Car?
    var InsuranceB : Insurance?
    var captureSession : AVCaptureSession!
    var previewLayer : AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConstatViewModel().recupererTout(ids: "6389f786591f1cab0201f26563790b8f9ad9c620383633ef6395e7c8b46cd6f005f4b04c", completed: {success, data in
            if success {
                self.present(Alert.makeAlert(titre: "Done", message: "load cars "),animated: true)
                print(data!)
                let dataB = data as! [AnyObject]
                self.CarB = (dataB[0] as! Car)
                self.userB = (dataB[1] as! User)
                self.InsuranceB = (dataB[2] as! Insurance)
                
                print(self.CarB!)
            } else {
                self.present(Alert.makeAlert(titre: "Error", message: "Could not load cars "),animated: true)
            }
        })

        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
                print("Simulator")
                return
            }
            let videoInput : AVCaptureInput
            do {
                videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            } catch {
                return
            }
            if (self.captureSession.canAddInput(videoInput)) {
                self.captureSession.addInput(videoInput)
            } else {
                return
            }
            let metadataOutput = AVCaptureMetadataOutput()
            if(self.captureSession.canAddOutput(metadataOutput)) {
                self.captureSession.addOutput(metadataOutput)
                metadataOutput.metadataObjectTypes = [.ean8, .ean13 , .pdf417,.qr]
            } else {
                return
            }
            self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
            self.previewLayer.frame = self.view.layer.bounds
            self.previewLayer.videoGravity = .resizeAspectFill
            self.view.layer.addSublayer(self.previewLayer)
            print("running")
            self.captureSession.startRunning()
        })
        
    }
    
    @IBAction func ClickNext(_ sender: Any) {
        performSegue(withIdentifier: "SelectedTypeBSegue", sender: CarB?._id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectedTypeBSegue" {
            let destination = segue.destination as! SelectTypeBViewController
            destination.carBid = CarB?._id
        }
    }
}

extension QrCodeScannerViewController : AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let first = metadataObjects.first {
            guard let readableObject = first as? AVMetadataMachineReadableCodeObject else {return}
            guard let stringValue = readableObject.stringValue else {
                return
            }
            found(code: stringValue)
        } else {
            print("not Able to read the code")
        }
    }
    func found(code : String) {
        ConstatViewModel().recupererTout(ids: code, completed: {success, data in
            if success {
                
                self.present(Alert.makeAlert(titre: "Done", message: "load cars "),animated: true)
                
            } else {
                self.present(Alert.makeAlert(titre: "Error", message: "Could not load cars "),animated: true)
            }
        })
    }

}
