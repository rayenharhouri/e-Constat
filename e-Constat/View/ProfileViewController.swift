//
//  ProfileViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 18/11/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let Token = UserDefaults.standard.object(forKey: "userToken") as! String
        print(Token)
        UserViewModel().getProfil()
        //let user = UserDefaults.standard.object(forKey: "User")
        
        print("mehreeeezzz")
    }
    
    

}
