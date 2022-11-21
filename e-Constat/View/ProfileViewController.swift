//
//  ProfileViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 18/11/2022.
//

import UIKit

class ProfileViewController: UIViewController {
      
    var name : String = ""
    var lastName : String = ""
    var password : String = ""
    var email : String = ""
    var adress : String = ""
    var driverLicense : String = ""
    var delevredOn : String = ""
    var number: Int = 0
    
    @IBOutlet weak var editNameB: UIButton!
    
    @IBOutlet weak var editDLB: UIButton!
    @IBOutlet weak var editLNB: UIButton!
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var driverLicenseOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UILabel!
    @IBOutlet weak var lastNameOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.viewControllers.remove(at: 1)
        navigationController?.viewControllers.remove(at: 0)
        let Token = UserDefaults.standard.object(forKey: "userToken") as! String
        print(Token)
        UserViewModel().getProfil()
       if  let data = UserDefaults.standard.data(forKey: "utilisateur")
        {
        do {
            let decoder =  JSONDecoder()
            let user = try decoder.decode(User.self, from: data)
            name = user.name
            lastName = user.lastName
            email = user.email
            adress = user.adress
            number = user.number
            driverLicense = user.driverLicense
            delevredOn = user.delevredOn
        } catch {
            print("Unable to decode")
        }
       }
        print(name)
        print(lastName)
        print(email)
        print(adress)
        print(driverLicense)
        self.nameOutlet.isUserInteractionEnabled = false
        self.driverLicenseOutlet.isUserInteractionEnabled = false
        self.lastNameOutlet.isUserInteractionEnabled = false
        nameOutlet.text = name
        lastNameOutlet.text = lastName
        emailOutlet.text = email
        driverLicenseOutlet.text = driverLicense
       
      
    }
    
    @IBAction func editAction(_ sender: Any) {
        
    }
    
    @IBAction func nameEdit(_ sender: Any) {
        if (self.nameOutlet.isUserInteractionEnabled == false) {
            self.nameOutlet.isUserInteractionEnabled = true
            editNameB.tintColor = UIColor.blue
        } else {
            editNameB.tintColor = UIColor.systemGreen
            self.nameOutlet.isUserInteractionEnabled = false
        }
    }
    @IBAction func lastNameEdit(_ sender: Any) {
        if (self.lastNameOutlet.isUserInteractionEnabled == false) {
            editLNB.tintColor = UIColor.blue
            self.lastNameOutlet.isUserInteractionEnabled = true
        } else {
            editLNB.tintColor = UIColor.systemGreen
            self.lastNameOutlet.isUserInteractionEnabled = false
        }
    }
    
    @IBAction func driverLedit(_ sender: Any) {
        if (self.driverLicenseOutlet.isUserInteractionEnabled == false) {
            editDLB.tintColor = UIColor.blue
            self.driverLicenseOutlet.isUserInteractionEnabled = true
        } else {
            editDLB.tintColor = UIColor.systemGreen
            self.driverLicenseOutlet.isUserInteractionEnabled = false
        }
    }
    
}
