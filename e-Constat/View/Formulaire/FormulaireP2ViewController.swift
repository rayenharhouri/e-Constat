//
//  FormulaireP2ViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 21/11/2022.
//

import UIKit

class FormulaireP2ViewController: UIViewController {
    //delclaration P1
    var whereAccidentHappnedP2: String = ""
    var dateOfAccidentP2 = Date()
 
    //declaration P2
    
    @IBOutlet weak var nameAndLastNameW1TF: UITextField!
    @IBOutlet weak var numberW1TF: UITextField!
    
    
    @IBOutlet weak var nameAndLastNameW2TF: UITextField!
    @IBOutlet weak var numberW2TF: UITextField!
    
    
    @IBOutlet weak var nameAndLastNameW3TF: UITextField!
    @IBOutlet weak var numberW3TF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("page2")
        print(whereAccidentHappnedP2)
        print(dateOfAccidentP2)
        print("/////////////////")
    
    }
    
    
    @IBAction func nextbutton(_ sender: Any) {
        
      let vcP3 = storyboard?.instantiateViewController(identifier: "vcP3") as! FormulaireP3ViewController
        vcP3.dateOfAccidentP3 = dateOfAccidentP2
        vcP3.whereAccidentHappnedP3 = whereAccidentHappnedP2
        
        vcP3.nameAndLastNameW1P3 = nameAndLastNameW1TF.text!
        vcP3.numberW1P3 = Int(numberW1TF.text!)
        
        vcP3.nameAndLastNameW2P3 = nameAndLastNameW2TF.text!
        vcP3.numberW2P3 = Int(numberW2TF.text!)
        
        vcP3.nameAndLastNameW3P3 = nameAndLastNameW3TF.text!
        vcP3.numberW3P3 = Int(numberW3TF.text!)
        
        self.navigationController?.pushViewController(vcP3, animated: true)
        
     
        

    }
    

}
