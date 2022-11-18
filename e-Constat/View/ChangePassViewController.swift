//
//  ChangePassViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 18/11/2022.
//

import UIKit

class ChangePassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //UpdatePassword OUTLET
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var newPasswordConfirm: UITextField!
    @IBOutlet weak var emailChangePassword: UITextField!
    //UpdatePasswordFunction
    @IBAction func changePassword(_ sender: Any) {
        UserViewModel().updatePassword(newPassword: newPassword.text!, newPasswordConfirm: newPasswordConfirm.text!, email: emailChangePassword.text!,completed: { (success, reponse) in
                if success {
                    self.performSegue(withIdentifier: "goBackLogin", sender: nil)
                    print("passed")
            } else {
                self.present(Alert.makeAlert(titre: "Warning", message: "Verify your Password"), animated: true)
            }
        })
    }

}
