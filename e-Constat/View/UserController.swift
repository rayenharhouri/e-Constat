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
    
  
    @IBOutlet weak var firstNameSTF: UITextField!{
        didSet {
            firstNameSTF.layer.masksToBounds = true
            firstNameSTF.layer.cornerRadius = 25
            firstNameSTF.layer.borderWidth = 1
            firstNameSTF.backgroundColor = UIColor.systemGray6
            firstNameSTF.tintColor = UIColor.lightGray
           // firstNameSTF.setIcon(UIImage(named: "lock")!)
        }}
    
    
    @IBOutlet weak var lastNameSTF: UITextField!{
        didSet {
            lastNameSTF.layer.masksToBounds = true
            lastNameSTF.layer.cornerRadius = 25
            lastNameSTF.layer.borderWidth = 1
            lastNameSTF.backgroundColor = UIColor.systemGray6
            lastNameSTF.tintColor = UIColor.lightGray
           // firstNameSTF.setIcon(UIImage(named: "lock")!)
        }}
    
    
    @IBOutlet weak var emailSTF: UITextField!{
        didSet {
            emailSTF.layer.masksToBounds = true
            emailSTF.layer.cornerRadius = 25
            emailSTF.layer.borderWidth = 1
            emailSTF.backgroundColor = UIColor.systemGray6
            emailSTF.tintColor = UIColor.lightGray
            
           // firstNameSTF.setIcon(UIImage(named: "lock")!)
        }}
    
    
    @IBOutlet weak var adressSTF: UITextField!{
        didSet {
            adressSTF.layer.masksToBounds = true
            adressSTF.layer.cornerRadius = 25
            adressSTF.layer.borderWidth = 1
            adressSTF.backgroundColor = UIColor.systemGray6
            adressSTF.tintColor = UIColor.lightGray
           // firstNameSTF.setIcon(UIImage(named: "lock")!)
        }}
    
    
    @IBOutlet weak var phoneSTF: UITextField!{
        didSet {
            phoneSTF.layer.masksToBounds = true
            phoneSTF.layer.cornerRadius = 25
            phoneSTF.layer.borderWidth = 1
            phoneSTF.backgroundColor = UIColor.systemGray6
            phoneSTF.tintColor = UIColor.lightGray
        }}
    
    
    
    @IBOutlet weak var passwordSTF: UITextField!{
        didSet {
            passwordSTF.layer.masksToBounds = true
            passwordSTF.layer.cornerRadius = 25
            passwordSTF.layer.borderWidth = 1
            passwordSTF.backgroundColor = UIColor.systemGray6
            passwordSTF.tintColor = UIColor.lightGray
           // firstNameSTF.setIcon(UIImage(named: "lock")!)
        }}
    
    
    @IBOutlet weak var driverLicenceSTF: UITextField!{
        didSet {
            driverLicenceSTF.layer.masksToBounds = true
            driverLicenceSTF.layer.cornerRadius = 25
            driverLicenceSTF.layer.borderWidth = 1
            driverLicenceSTF.backgroundColor = UIColor.systemGray6
            driverLicenceSTF.tintColor = UIColor.lightGray
            //firstNameSTF.setIcon(UIImage(named: "lock")!)
        }}
    
    
    @IBOutlet weak var delevredOnDP: UIDatePicker!{
        didSet {
           // delevredOnDP.layer.masksToBounds = true
            //delevredOnDP.layer.cornerRadius = 25
            //delevredOnDP.layer.borderWidth = 2
            //delevredOnDP.backgroundColor = UIColor.systemGray6
            //delevredOnDP.tintColor = UIColor.lightGray
           // firstNameSTF.setIcon(UIImage(named: "lock")!)
        }}
    //func sgin up
    @IBAction func SignUpAction(_ sender: Any) {
        let user = User(name: firstNameSTF.text!, password: passwordSTF.text!, email: emailSTF.text!, lastName:  lastNameSTF.text!,number: Int(phoneSTF.text!)!,driverLicense: driverLicenceSTF.text!,delevredOn: delevredOnDP.date.description ,adress:adressSTF.text!)
        
        UserViewModel().SignUp(user: user)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            UserViewModel().SendVerification(email: self.emailSTF.text!)
         }
    }
    //FORGOT PASSWORD OUTLET
    @IBOutlet weak var emailFP: UITextField!
    @IBOutlet weak var otpUser: UITextField!
    
    //FORGET PASSWORD FUNCTION
    
    @IBAction func sendOTP(_ sender: Any) {
        UserViewModel().SendOTP(email: emailFP.text!)
    }
    @IBAction func confirmOTP(_ sender: Any) {
        UserViewModel().confirmOTP(otp: otpUser.text!)
    }
}
