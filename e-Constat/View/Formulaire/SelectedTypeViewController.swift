//
//  SelectedTypeViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 5/12/2022.
//

import UIKit

class SelectedTypeViewController: UIViewController {
    var type : String = ""

    @IBOutlet weak var BottomRightB: UIButton!
    @IBOutlet weak var TopRightB: UIButton!
    @IBOutlet weak var ButtomLeftB: UIButton!
    @IBOutlet weak var MidRightB: UIButton!
    @IBOutlet weak var MidLeftB: UIButton!
    @IBOutlet weak var TopLeftB: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageOutlet.image = UIImage(named: type)?.rotate(radians: .pi/2)
    }
    
    @IBAction func BottomLeft(_ sender: Any) {
        var color = ButtomLeftB.tintColor.accessibilityName
        print(color)
        if(ButtomLeftB.tintColor.accessibilityName == "cyan blue"){
            ButtomLeftB.tintColor = UIColor.red
            ButtomLeftB.setImage(UIImage(systemName: "xmark"), for: .normal)
        } else {
            ButtomLeftB.tintColor = UIColor.link
            ButtomLeftB.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }
        
    }
    @IBAction func MidLeft(_ sender: Any) {
        var color = MidLeftB.tintColor.accessibilityName
        print(color)
        if(MidLeftB.tintColor.accessibilityName == "cyan blue"){
            MidLeftB.tintColor = UIColor.red
            MidLeftB.setImage(UIImage(systemName: "xmark"), for: .normal)
        } else {
            MidLeftB.tintColor = UIColor.link
            MidLeftB.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }
    }
    @IBAction func TopLeft(_ sender: Any) {
        var color = TopLeftB.tintColor.accessibilityName
        print(color)
        if(TopLeftB.tintColor.accessibilityName == "cyan blue"){
            TopLeftB.tintColor = UIColor.red
            TopLeftB.setImage(UIImage(systemName: "xmark"), for: .normal)
        } else {
            TopLeftB.tintColor = UIColor.link
            TopLeftB.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }
    }
    @IBAction func TopRight(_ sender: Any) {
        var color = TopRightB.tintColor.accessibilityName
        print(color)
        if(TopRightB.tintColor.accessibilityName == "cyan blue"){
            TopRightB.tintColor = UIColor.red
            TopRightB.setImage(UIImage(systemName: "xmark"), for: .normal)
        } else {
            TopRightB.tintColor = UIColor.link
            TopRightB.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }
    }
    @IBAction func MidRight(_ sender: Any) {
        var color = MidRightB.tintColor.accessibilityName
        print(color)
        if(MidRightB.tintColor.accessibilityName == "cyan blue"){
            MidRightB.tintColor = UIColor.red
            MidRightB.setImage(UIImage(systemName: "xmark"), for: .normal)
        } else {
            MidRightB.tintColor = UIColor.link
            MidRightB.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }
    }
    @IBAction func bottomRight(_ sender: Any) {
        var color = BottomRightB.tintColor.accessibilityName
        print(color)
        if(BottomRightB.tintColor.accessibilityName == "cyan blue"){
            BottomRightB.tintColor = UIColor.red
            BottomRightB.setImage(UIImage(systemName: "xmark"), for: .normal)
        } else {
            BottomRightB.tintColor = UIColor.link
            BottomRightB.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }
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
