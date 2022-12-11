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
        //UserDefaults.standard.object(forKey: "userToken") as! String
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        }
    
    //function
    //OUTLET Login
    
    @IBOutlet weak var passwordField: UITextField!{
        didSet {
            passwordField.layer.masksToBounds = true
            passwordField.layer.cornerRadius = 25
            passwordField.layer.borderColor = UIColor.link.cgColor
            passwordField.layer.borderWidth = 1
            passwordField.backgroundColor = UIColor.systemGray6
            passwordField.tintColor = UIColor.lightGray
            passwordField.setIcon(UIImage(named: "password")!)
        }}
    
    @IBOutlet weak var emailField: UITextField!{
        didSet {
            emailField.layer.masksToBounds = true
            emailField.layer.cornerRadius = 25
            emailField.layer.borderColor = UIColor.link.cgColor
            emailField.layer.borderWidth = 1
            emailField.backgroundColor = UIColor.systemGray6
            emailField.tintColor = UIColor.lightGray
            emailField.setIcon(UIImage(named: "mail")!)
        }}
   
    
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
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
