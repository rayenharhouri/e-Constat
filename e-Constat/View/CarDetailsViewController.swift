//
//  CarDetailsViewController.swift
//  e-Constat
//
//  Created by MacBook Pro on 29/11/2022.
//

import UIKit

class CarDetailsViewController: UIViewController {
    var name : String = ""
    @IBOutlet weak var insuranceLabel: UILabel!
    @IBOutlet weak var insuranceImage: UIImageView!
    var lastName : String = ""
    var Insurance : Insurance?
    var currentCar : Car? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        insuranceImage.isHidden = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        getInsurance()
    }
    func getInsurance() {
        InsuranceViewModel.sharedInstance.recupererTout(carId: currentCar?._id ?? "", completed:  {success, insurances in
            if success {
                self.Insurance = insurances!
                self.insuranceImage.isHidden = false
                self.insuranceImage.load(url: self.Insurance!.image)
                self.InsuranceButtonOutlet.isHidden = true
                
                if self.Insurance == nil {
                    print("lsit empty")
                } else {
                    print("okeeeeeey")
                }
                print("&&&&&&&&&")
                print(self.Insurance ?? "")
                print("&&&&&&&&&")
            } else {
                self.present(Alert.makeAlert(titre: "Error", message: "Could not load cars "),animated: true)
            }
        }
        )
    }
    @IBOutlet weak var brandL: UILabel!
    
    @IBOutlet weak var typeL: UILabel!
    @IBOutlet weak var immL: UILabel!
    @IBOutlet weak var serialNumberL: UILabel!
    @IBOutlet weak var carImageOutlet: UIImageView!
    @IBOutlet weak var owenerL: UILabel!
    
   
    @IBOutlet weak var fiscalPoweL: UILabel!
    @IBOutlet weak var lastNameL: UILabel!
    @IBOutlet weak var firstNameL: UILabel!
    func initializeView() {
        
        carImageOutlet.load(url: currentCar?.carIcon ?? "http://localhost:3000/img/Citroen.png")
        typeL.text = currentCar?.type
        immL.text = currentCar?.numSerie
        brandL.text = currentCar?.brand
        
        fiscalPoweL.text = "7 CV"
        serialNumberL.text = currentCar?.numImm
        if  let data = UserDefaults.standard.data(forKey: "utilisateur")
         {
         do {
             let decoder =  JSONDecoder()
             let user = try decoder.decode(User.self, from: data)
             name = user.name
             lastName = user.lastName
         } catch {
             print("Unable to decode")
              }
        }
        lastNameL.text = lastName
        firstNameL.text = name
    }
    @IBOutlet weak var InsuranceButtonOutlet: UIButton!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "insuranceSegue" {
            let destination = segue.destination as! NewInsuranceViewController
            destination.currentCar = currentCar
        }
    }
    
    @IBAction func onClickInsurance(_ sender: Any) {
        self.performSegue(withIdentifier: "insuranceSegue", sender: currentCar)
    }
}


