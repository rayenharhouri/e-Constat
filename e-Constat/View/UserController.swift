//
//  UserController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 11/11/2022.
//

import UIKit

class UserController: UIViewController {
    
    //variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //OUTLET Login
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    //function
    
    @IBAction func LoginAction(_ sender: Any) {
        UserViewModel().LogIn(email: emailField.text!, password: passwordField.text!)
    }
    
    //OUTLET SIGNUP
    
    @IBOutlet weak var firstNameSTF: UITextField!
    @IBOutlet weak var lastNameSTF: UITextField!
    @IBOutlet weak var emailSTF: UITextField!
    @IBOutlet weak var adressSTF: UITextField!
    @IBOutlet weak var phoneSTF: UITextField!
    @IBOutlet weak var passwordSTF: UITextField!
    @IBOutlet weak var driverLicenceSTF: UITextField!
    @IBOutlet weak var deleveredOnSTF: UITextField!
    //func sgin up
    
    @IBAction func SignUpAction(_ sender: Any) {
        
          
        
        var user = User(name: firstNameSTF.text!, password: passwordSTF.text!, email: emailSTF.text!, lastName:  lastNameSTF.text!,number: Int(phoneSTF.text!)!,driverLicense: driverLicenceSTF.text!,delevredOn: deleveredOnSTF.text!,adress:adressSTF.text!)
        
        print(user.name)
        print(user.lastName)
        print(user.email)
        print(user.number)
        print(user.adress)
        print(user.driverLicense)
        print(user.delevredOn)
        UserViewModel().SignUp(user: user)
    }
    
    

}
