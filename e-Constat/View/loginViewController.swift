//
//  loginViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 18/11/2022.
//

import UIKit

class loginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //function
    //OUTLET Login
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func LoginAction(_ sender: Any) {
        UserViewModel().LogIn(email: emailField.text!, password: passwordField.text!,completed: { (success, reponse) in
            if success {
                let utilisateur = reponse as! User
                print(utilisateur)
                print(utilisateur.verified!)
                if utilisateur.verified! {
                    self.performSegue(withIdentifier: "connexionSegue", sender: nil)
                    print("passed")
                    
                } else {
                    print("ops")
                    let action = UIAlertAction(title: "Réenvoyer", style: .default) { UIAlertAction in
                        UserViewModel().SendVerification(email: self.emailField.text!)
                        print(self.emailField.text!)
                    }
                    print("ops")
                    self.present(Alert.makeActionAlert(titre: "Notice", message: "This email is not confirmed, would you like to resend the confirmation email to " + utilisateur.email + " ?", action: action),animated: true)
                }
            } else {
                self.present(Alert.makeAlert(titre: "Warning", message: "Email or password incorrect"), animated: true)
            }
        })
    }

}
