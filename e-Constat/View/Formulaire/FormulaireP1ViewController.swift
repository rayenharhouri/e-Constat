//
//  FormulaireP1ViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 21/11/2022.
//

import UIKit

class FormulaireP1ViewController: UIViewController {
    
    
    

    
   
    @IBOutlet weak var dateOfAccident: UIDatePicker!
    @IBOutlet weak var whereAccidentHappnedTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.isNavigationBarHidden = false
        
        // Do any additional setup after loading the view.
    }
    
    
   
    
    @IBAction func buttonNext(_ sender: Any) {
       
        let vcP2 = storyboard?.instantiateViewController(identifier: "vcP2") as! FormulaireP2ViewController
        vcP2.whereAccidentHappnedP2 = whereAccidentHappnedTF.text!
        vcP2.dateOfAccidentP2 = dateOfAccident.date
        self.navigationController?.pushViewController(vcP2, animated: true)
        
    }
                
}
