//
//  OTPViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 18/11/2022.
//

import UIKit

class OTPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var otpUser: UITextField!
    
    @IBAction func confirmOTP(_ sender: Any) {
        
        UserViewModel().confirmOTP(otp: otpUser.text!,completed: { (success, reponse) in
                if success {
                    self.performSegue(withIdentifier: "updatePasswordSegue", sender: nil)
                    print("passed")
            } else {
                self.present(Alert.makeAlert(titre: "Warning", message: "Incorrect OTP"), animated: true)
            }
        })
    }
    
}
