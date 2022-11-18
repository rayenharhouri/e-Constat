//
//  ForgetPassViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 18/11/2022.
//

import UIKit

class ForgetPassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var emailFP: UITextField!
    //FORGET PASSWORD FUNCTION
    
    @IBAction func sendOTP(_ sender: Any) {
        UserViewModel().SendOTP(email: emailFP.text!,completed: { (success, reponse) in
                if success {
                    self.performSegue(withIdentifier: "sendOTPsegue", sender: nil)
                    print("passed")
            } else {
                self.present(Alert.makeAlert(titre: "Warning", message: " incorrect email"), animated: true)
            }
        })
    }

}
