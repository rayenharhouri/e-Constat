//
//  FormulaireP1ViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 21/11/2022.
//

import UIKit

class FormulaireP1ViewController: UIViewController {
    
    
    
    @IBOutlet weak var firstNameTF: UITextField!
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
   
    
    @IBAction func buttonNext(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier:"Formulaire2") as! FormulaireP2ViewController
        controller.text = firstNameTF.text
        present(controller, animated: true ,completion : nil)
    }
                
}
