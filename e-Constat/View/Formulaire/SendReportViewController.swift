//
//  SendReportViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 2/1/2023.
//

import UIKit

class SendReportViewController: UIViewController {
    var email : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func SendMail(_ sender: Any) {
        if  let data = UserDefaults.standard.data(forKey: "utilisateur")
         {
         do {
             let decoder =  JSONDecoder()
             let user = try decoder.decode(User.self, from: data)
             
             email = user.email
             
         } catch {
             print("Unable to decode")
              }
        }
        ConstatViewModel().SendMail(email: email)
    }
    

}
