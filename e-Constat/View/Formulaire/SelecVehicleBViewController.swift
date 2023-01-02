//
//  SelecVehicleBViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 11/12/2022.
//

import UIKit

class SelecVehicleBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ImageOutlet.image = UIImage(named: type)?.rotate(radians: .pi/2)
    }

    var type : String = ""
    var carId : String?
    var BottomRight : Bool = true
    var BottomLeft : Bool = true
    var TopRight : Bool = true
    var MidRight : Bool = true
    var MidLeft : Bool = true
    var TopLeft : Bool = true
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue" {
            let destination = segue.destination as! SketchViewController
        }
    }

    
    
    @IBOutlet weak var TopLeftB: UIButton!
    @IBOutlet weak var MidLeftB: UIButton!
    @IBOutlet weak var MidRightB: UIButton!
    @IBOutlet weak var BottomRightB: UIButton!
    @IBOutlet weak var TopRightB: UIButton!
    @IBOutlet weak var ButtomLeftB: UIButton!
    
    @IBAction func BottomLef(_ sender: Any) {
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
   
    @IBAction func BottomRight(_ sender: Any) {
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
        
        performSegue(withIdentifier: "Segue", sender: nil)
    }
    @IBOutlet weak var ImageOutlet: UIImageView!
}
