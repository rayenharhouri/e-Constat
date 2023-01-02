//
//  SketchViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 26/11/2022.
//

import UIKit


class SketchViewController: UIViewController {
    
    

    @IBOutlet weak var collectionview: UICollectionView!
    
    @IBOutlet weak var canvasView: CanvasView!
    
    var items: [UIColor] = [UIColor.red, UIColor.green,UIColor.blue,UIColor.black,UIColor.white,UIColor.purple,UIColor.orange,UIColor.brown,UIColor.yellow ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seg" {
            let destination = segue.destination as! SendReportViewController
            
            }
    }
    @IBAction func Save(_ sender: Any) {
        let image = canvasView.save()
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(imageSaved(_:didFinishSavingWithError:contextType:)), nil)
        performSegue(withIdentifier: "Segue", sender: nil)
        
    }
    
    
    @objc func imageSaved(_ image: UIImage, didFinishSavingWithError error: Error?, contextType: UnsafeRawPointer)
    {
        if error != nil {
            print("Unable to save the image into photos")
        }else{
            print("Image saved into photos.")
        }
    }
    
    
    @IBAction func Undo(_ sender: Any) {
        canvasView.undoDraw()
    }
    
    
    @IBAction func Clear(_ sender: Any) {
        canvasView.clearCanvasView()
    }
    
    
    
    
}


extension SketchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let view =  cell.viewWithTag(5) {
            
            view.backgroundColor = items[indexPath.row]
            view.layer.cornerRadius = 5

        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        canvasView.strokeColor = items[indexPath.row]
    }
    
    
}


extension UIView {
    
    func save() ->UIImage{
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if image != nil {
            return image!
        }
        return UIImage()
        
    }
    
    

    
    
}
