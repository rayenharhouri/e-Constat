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
        //Storing the token in userdefault
        let Token = UserDefaults.standard.object(forKey: "userToken") as! String
        print(Token)
        UserViewModel().getProfil()
        
        //Decoding json and storing user information in userdefault
       if  let data = UserDefaults.standard.data(forKey: "utilisateur")
        {
        do {
            let decoder =  JSONDecoder()
            let user = try decoder.decode(User.self, from: data)
            name = user.name
            lastName = user.lastName
            email = user.email
            password = user.password
            adress = user.adress
            number = user.number
            driverLicense = user.driverLicense
            delevredOn = user.delevredOn
        } catch {
            print("Unable to decode")
             }
       }
        self.nameOutlet.isUserInteractionEnabled = false
        self.driverLicenseOutlet.isUserInteractionEnabled = false
        self.lastNameOutlet.isUserInteractionEnabled = false
        nameOutlet.text = name
        lastNameOutlet.text = lastName
        emailOutlet.text = email
        driverLicenseOutlet.text = driverLicense
    }
    
   
    //Logic of Enable editing and disabling
    @IBAction func nameEdit(_ sender: Any) {
        if (self.nameOutlet.isUserInteractionEnabled == false) {
            self.nameOutlet.isUserInteractionEnabled = true
            editNameB.tintColor = UIColor.blue
        } else {
            editNameB.tintColor = UIColor.systemGreen
            self.nameOutlet.isUserInteractionEnabled = false
        }
    }
    //Logic of Enable editing and disabling
    @IBAction func lastNameEdit(_ sender: Any) {
        if (self.lastNameOutlet.isUserInteractionEnabled == false) {
            editLNB.tintColor = UIColor.blue
            self.lastNameOutlet.isUserInteractionEnabled = true
        } else {
            editLNB.tintColor = UIColor.systemGreen
            self.lastNameOutlet.isUserInteractionEnabled = false
        }
    }
    //Logic of Enable editing and disabling
    @IBAction func editAction(_ sender: Any) {
        UserViewModel().updateProfil(name: nameOutlet.text!, lastName: lastNameOutlet.text!, driverLicense: driverLicenseOutlet.text!,completed: { (success, reponse) in
            if success {
                self.present(Alert.makeAlert(titre: "Done", message: "User Updated"), animated: true)
            } else {
                self.present(Alert.makeAlert(titre: "Warning", message: "Wrong Informations"), animated: true)
            }
        })
    }
    
    //Logic of Enable editing and disabling
    @IBAction func driverLedit(_ sender: Any) {
        if (self.driverLicenseOutlet.isUserInteractionEnabled == false) {
            editDLB.tintColor = UIColor.blue
            self.driverLicenseOutlet.isUserInteractionEnabled = true
        } else {
            editDLB.tintColor = UIColor.systemGreen
            self.driverLicenseOutlet.isUserInteractionEnabled = false
        }
    }
    
    
   
    
    @IBAction func LogOut(_ sender: Any) {
        let Token = UserDefaults.standard.object(forKey: "userToken") as! String
        print(Token)
        UserViewModel().Logout()
        let vclogin = storyboard?.instantiateViewController(identifier: "loginID") as! loginViewController
       
        self.navigationController?.pushViewController(vclogin, animated: true)
       
    }
    
    
    
    @IBAction func Darkmode(_ sender: UISwitch) {
        if #available(ios 13.0, *){
            
            let appDelegate = UIApplication.shared.windows.first
            
            if sender.isOn {
                appDelegate?.overrideUserInterfaceStyle = .dark
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
            return
            
        }else{
            
        }
        
        
    }
    
    
    
    
    
}
