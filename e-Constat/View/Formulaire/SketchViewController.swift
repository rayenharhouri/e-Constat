//
//  SketchViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 26/11/2022.
//

import UIKit
import PencilKit
import PhotosUI

class SketchViewController: UIViewController,PKCanvasViewDelegate,PKToolPickerObserver {
    
    
    let canvasView: PKCanvasView =
    {
        let canvas = PKCanvasView()
        canvas.drawingPolicy = .anyInput
        return canvas
     
    }()
    
    let drawing = PKDrawing()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvasView.drawing = drawing
        canvasView.delegate = self
   
        canvasView.alwaysBounceVertical = true
        view.addSubview(canvasView)
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        canvasView.frame = view.bounds
        canvasView.tool.self
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
     super.viewDidAppear(animated)
        let toolPicker = PKToolPicker()
        
        
        //toolPicker.setVisible(true , forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()

    }
    
    

    @IBAction func saveDrawing(_ sender: Any) {
        UIGraphicsBeginImageContextWithOptions(canvasView.bounds.size, false, UIScreen.main.scale)
        canvasView.drawHierarchy(in: canvasView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if image != nil
        {
            PHPhotoLibrary.shared().performChanges( {
                PHAssetChangeRequest.creationRequestForAsset(from: image!)
            },completionHandler: {succes, error in
            })
        }
        
    }
    
    
    
    @IBAction func restore(_ sender: Any) {
        canvasView.drawing = drawing
    }
    
    

}
