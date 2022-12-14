//
//  SignUpViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 18/11/2022.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var firstNameSTF: UITextField!{
        didSet {
            firstNameSTF.layer.masksToBounds = true
            firstNameSTF.layer.cornerRadius = 25
            firstNameSTF.layer.borderColor = UIColor.link.cgColor
            firstNameSTF.layer.borderWidth = 1
            firstNameSTF.backgroundColor = UIColor.systemGray6
            firstNameSTF.tintColor = UIColor.lightGray
            firstNameSTF.setIcon(UIImage(named: "user")!)
        }}
    
    
    @IBOutlet weak var lastNameSTF: UITextField!{
        didSet {
            lastNameSTF.layer.masksToBounds = true
            lastNameSTF.layer.borderColor = UIColor.link.cgColor
            lastNameSTF.layer.cornerRadius = 25
            lastNameSTF.layer.borderWidth = 1
            lastNameSTF.backgroundColor = UIColor.systemGray6
            lastNameSTF.tintColor = UIColor.lightGray
           lastNameSTF.setIcon(UIImage(named: "user")!)
        }}
    
    
    @IBOutlet weak var emailSTF: UITextField!{
        didSet {
            emailSTF.layer.masksToBounds = true
            emailSTF.layer.cornerRadius = 25
            emailSTF.layer.borderColor = UIColor.link.cgColor
            emailSTF.layer.borderWidth = 1
            emailSTF.backgroundColor = UIColor.systemGray6
            emailSTF.tintColor = UIColor.lightGray
            
            emailSTF.setIcon(UIImage(named: "mail")!)
        }}
    
    
    @IBOutlet weak var adressSTF: UITextField!{
        didSet {
            adressSTF.layer.masksToBounds = true
            adressSTF.layer.cornerRadius = 25
            adressSTF.layer.borderColor = UIColor.link.cgColor
            adressSTF.layer.borderWidth = 1
            adressSTF.backgroundColor = UIColor.systemGray6
            adressSTF.tintColor = UIColor.lightGray
           adressSTF.setIcon(UIImage(named: "adress")!)
        }}
    
    
    @IBOutlet weak var phoneSTF: UITextField!{
        didSet {
            phoneSTF.layer.masksToBounds = true
            phoneSTF.layer.cornerRadius = 25
            phoneSTF.layer.borderColor = UIColor.link.cgColor
            phoneSTF.layer.borderWidth = 1
            phoneSTF.backgroundColor = UIColor.systemGray6
            phoneSTF.tintColor = UIColor.lightGray
            phoneSTF.setIcon(UIImage(named: "phone")!)
        }}
    
    
    
    @IBOutlet weak var passwordSTF: UITextField!{
        didSet {
            passwordSTF.layer.masksToBounds = true
            passwordSTF.layer.borderColor = UIColor.link.cgColor
            passwordSTF.layer.cornerRadius = 25
            passwordSTF.layer.borderWidth = 1
            passwordSTF.backgroundColor = UIColor.systemGray6
            passwordSTF.tintColor = UIColor.lightGray
           passwordSTF.setIcon(UIImage(named: "password")!)
        }}
    
    
    @IBOutlet weak var driverLicenceSTF: UITextField!{
        didSet {
            driverLicenceSTF.layer.masksToBounds = true
            driverLicenceSTF.layer.borderColor = UIColor.link.cgColor
            driverLicenceSTF.layer.cornerRadius = 25
            driverLicenceSTF.layer.borderWidth = 1
            driverLicenceSTF.backgroundColor = UIColor.systemGray6
            driverLicenceSTF.tintColor = UIColor.lightGray
            driverLicenceSTF.setIcon(UIImage(named: "driverLicense")!)
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
        let user = User(name: firstNameSTF.text!, password: passwordSTF.text!, email: emailSTF.text!, lastName:  lastNameSTF.text!,number: Int(phoneSTF.text!)!,driverLicense: driverLicenceSTF.text!,delevredOn: delevredOnDP.date.description ,adress:adressSTF.text!,verified: false)
        self.performSegue(withIdentifier: "LoginAfterSignUpSegue", sender: nil)
        
        UserViewModel().SignUp(user: user)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            UserViewModel().SendVerification(email: self.emailSTF.text!)
         }
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}

