//
//  CarDetailsViewController.swift
//  e-Constat
//
//  Created by MacBook Pro on 29/11/2022.
//

import UIKit
import CoreImage.CIFilterBuiltins

class CarDetailsViewController: UIViewController {
    
    @IBOutlet weak var insuranceImage: UIImageView!
    @IBOutlet weak var InsuranceButtonOutlet: UIButton!
    var name : String = ""
    var idUser : String = ""
    @IBOutlet weak var insuranceLabel: UILabel!
    var lastName : String = ""
    var Insurance : Insurance?
    var currentCar : Car? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        insuranceImage.isHidden = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func QRCodeOnClick(_ sender: Any) {
        genreateQRCode(idCar: (currentCar?._id)!, idUser: idUser, idInsurance: (Insurance?._id)!)
    }
    
    func getInsurance(id : String) {
        InsuranceViewModel.sharedInstance.recupererTout(carId: id, completed:  {success, insurances in
            if success {
                self.Insurance = insurances!
                if self.Insurance == nil {
                    print("lsit empty")
                } else {
                    print("okeeeeeey")
                }
                
                if ((self.Insurance?.image == "") == false) {
                    self.getInsuranceData()
                    
                    
                    self.insuranceImage.load(url: self.Insurance!.image)
                }
                
                
            } else {
                self.present(Alert.makeAlert(titre: "Error", message: "Could not load cars "),animated: true)
            }
        }
        )
    }
    func getInsuranceData() {
        self.insuranceImage.isHidden = false
        InsuranceButtonOutlet.isHidden = true
        print(Insurance?.image)
        
    }
    @IBOutlet weak var brandL: UILabel!
    
    
    @IBOutlet weak var typeL: UILabel!
    @IBOutlet weak var immL: UILabel!
    @IBOutlet weak var serialNumberL: UILabel!
    @IBOutlet weak var carImageOutlet: UIImageView!
    @IBOutlet weak var owenerL: UILabel!
    @IBOutlet weak var table1Outlet: UIImageView!
    @IBOutlet weak var Table2outlet: UIImageView!
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
             idUser = user._id!
             name = user.name
             lastName = user.lastName
         } catch {
             print("Unable to decode")
              }
        }
        lastNameL.text = lastName
        firstNameL.text = name
        getInsurance(id: (currentCar?._id)!)
    }
    func genreateQRCode(idCar: String, idUser: String, idInsurance: String) {
        carImageOutlet.layer.shouldRasterize = true
        carImageOutlet.layer.magnificationFilter = CALayerContentsFilter.nearest
        typeL.isHidden = true
        immL.isHidden = true
        brandL.isHidden = true
        fiscalPoweL.isHidden = true
        serialNumberL.isHidden = true
        lastNameL.isHidden = true
        firstNameL.isHidden = true
        Table2outlet.isHidden = true
        table1Outlet.isHidden = true
        insuranceImage.isHidden = true
        carImageOutlet.image = QRCode(idCar: idCar, idUser: idUser, idInsurance: idInsurance)
        
    }
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    
    func QRCode(idCar : String , idUser : String , idInsurance :  String) -> UIImage? {
        let data = idCar+idUser+idInsurance
        let QrData = Data(data.utf8)
        filter.setValue(QrData, forKey: "inputMessage")
        if let qrCodeImage =  filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent) {
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        return UIImage(systemName: "xmark") ?? UIImage()
    }
   
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




