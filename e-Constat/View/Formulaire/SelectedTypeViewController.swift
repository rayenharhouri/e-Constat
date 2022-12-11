//
//  SelectedTypeViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 5/12/2022.
//

import UIKit

class SelectedTypeViewController: UIViewController {
    var type : String = ""
    var carId : String?
    var BottomRight : Bool = true
    var BottomLeft : Bool = true
    var TopRight : Bool = true
    var MidRight : Bool = true
    var MidLeft : Bool = true
    var TopLeft : Bool = true


    @IBOutlet weak var BottomRightB: UIButton!
    @IBOutlet weak var TopRightB: UIButton!
    @IBOutlet weak var ButtomLeftB: UIButton!
    @IBOutlet weak var MidRightB: UIButton!
    @IBOutlet weak var MidLeftB: UIButton!
    @IBOutlet weak var TopLeftB: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageOutlet.image = UIImage(named: type)?.rotate(radians: .pi/2)
        print(carId!)
    }
    
    @IBAction func BottomLeft(_ sender: Any) {
        if(ButtomLeftB.tintColor.accessibilityName == "cyan blue"){
            ButtomLeftB.tintColor = UIColor.red
            ButtomLeftB.setImage(UIImage(systemName: "xmark"), for: .normal)
            BottomLeft = false
        } else {
            ButtomLeftB.tintColor = UIColor.link
            ButtomLeftB.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            BottomLeft = true
        }
        
    }
    @IBAction func MidLeft(_ sender: Any) {
        if(MidLeftB.tintColor.accessibilityName == "cyan blue"){
            MidLeftB.tintColor = UIColor.red
            MidLeftB.setImage(UIImage(systemName: "xmark"), for: .normal)
            MidLeft = false
        } else {
            MidLeftB.tintColor = UIColor.link
            MidLeftB.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            MidLeft = true
        }
    }
    @IBAction func TopLeft(_ sender: Any) {
        if(TopLeftB.tintColor.accessibilityName == "cyan blue"){
            TopLeftB.tintColor = UIColor.red
            TopLeftB.setImage(UIImage(systemName: "xmark"), for: .normal)
            TopLeft = false
        } else {
            TopLeftB.tintColor = UIColor.link
            TopLeftB.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            TopLeft = true
        }
    }
    @IBAction func TopRight(_ sender: Any) {
        if(TopRightB.tintColor.accessibilityName == "cyan blue"){
            TopRightB.tintColor = UIColor.red
            TopRightB.setImage(UIImage(systemName: "xmark"), for: .normal)
            TopRight = false
        } else {
            TopRightB.tintColor = UIColor.link
            TopRightB.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            TopRight = true
        }
    }
    @IBAction func MidRight(_ sender: Any) {
        if(MidRightB.tintColor.accessibilityName == "cyan blue"){
            MidRightB.tintColor = UIColor.red
            MidRightB.setImage(UIImage(systemName: "xmark"), for: .normal)
            MidRight = false
        } else {
            MidRightB.tintColor = UIColor.link
            MidRightB.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            MidRight = true
        }
    }
    @IBAction func bottomRight(_ sender: Any) {
        if(BottomRightB.tintColor.accessibilityName == "cyan blue"){
            BottomRightB.tintColor = UIColor.red
            BottomRightB.setImage(UIImage(systemName: "xmark"), for: .normal)
            MidLeft = false
        } else {
            BottomRightB.tintColor = UIColor.link
            BottomRightB.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            MidLeft = true
        }
    }
    
    @IBAction func ClickNext(_ sender: Any) {
        carDamageViewModel().addNew(TopLeft: TopLeft, MidLeft: MidLeft, BottomLeft: BottomLeft, TopRight: TopRight, MidRight: MidRight, bottomRight: BottomRight, carId: carId!, completed: {(success, reponse) in
                        if success {
                            let carDamage = reponse as! carDamage
                            print(carDamage)
                            //Add carDamageA to Constat
                            } else {
                            self.present(Alert.makeAlert(titre: "Warning", message: "Problem Accured"), animated: true)
                                    }
                                })
    }
    @IBOutlet weak var ImageOutlet: UIImageView!
}
extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}
