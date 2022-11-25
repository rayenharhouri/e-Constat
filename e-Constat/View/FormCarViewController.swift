//
//  FormCarViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 25/11/2022.
//

import UIKit

class FormCarViewController: UIViewController {
    
    @IBOutlet weak var TFnumSerie: UITextField!{
        didSet {
            TFnumSerie.layer.masksToBounds = true
            TFnumSerie.layer.borderWidth = 1
            TFnumSerie.layer.borderColor = UIColor.link.cgColor
            TFnumSerie.backgroundColor = UIColor.systemGray6
            TFnumSerie.setIcon(UIImage(named: "icons8-vérification-du-mot-de-passe-50")!)
        }}
    @IBOutlet weak var TFBrand: UITextField!{
        didSet {
            TFBrand.layer.masksToBounds = true
            TFBrand.layer.borderWidth = 1
            TFBrand.layer.borderColor = UIColor.link.cgColor
            TFBrand.backgroundColor = UIColor.systemGray6
            TFBrand.text = brand
        }
    }
    @IBOutlet weak var TFtype: UITextField!{
        didSet {
            TFtype.layer.masksToBounds = true
            TFtype.layer.borderWidth = 1
            TFtype.backgroundColor = UIColor.systemGray6
            TFtype.layer.borderColor = UIColor.link.cgColor
            TFtype.setIcon(UIImage(named: "icons8-voiture-48")!)
        }}
    @IBOutlet weak var TFimm1: UITextField!{
        didSet {
            TFimm1.layer.masksToBounds = true
            TFimm1.layer.borderWidth = 1
            TFimm1.backgroundColor = UIColor.black
            TFimm1.textColor = UIColor.white
            TFimm1.layer.borderColor = UIColor.black.cgColor

        }}
    @IBOutlet weak var TFimm2: UITextField!{
        didSet {
            TFimm2.layer.masksToBounds = true
            TFimm2.layer.borderWidth = 1
            TFimm2.layer.borderColor = UIColor.black.cgColor
            TFimm2.textColor = UIColor.white
            TFimm2.backgroundColor = UIColor.black

        }}
    var brand : String = ""
    let type = ["Essence","Diesel fuel","Diesel 50","Gasoline"]
    
    var typePickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TFtype.inputView = typePickerView
        TFtype.placeholder = "Select The Type Of Your Car"
        TFtype.textAlignment = .center
        TFBrand.textAlignment = .center
        TFimm1.textAlignment = .center
        TFimm2.textAlignment = .center
        typePickerView.delegate = self
        typePickerView.dataSource = self
        typePickerView.tag = 1
        
    }
    let userToken = UserDefaults.standard.object(forKey: "userToken") as! String
    @IBAction func AddNewCar(_ sender: Any) {
        CarViewModel().AddNewCar(brand: TFBrand.text!, type: TFtype.text!, numSerie: TFnumSerie.text!, fiscalPower: 2, numImma: TFimm1.text!+TFimm2.text!, userToken: userToken, completed: { (success, reponse) in
            if success {
                self.present(Alert.makeAlert(titre: "Succcess", message: "Car Added"), animated: true)
            } else {
                self.present(Alert.makeAlert(titre: "Warning", message: "Incorrect Inputs"), animated: true)
            }
        })
    }
}


extension FormCarViewController: UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        TFtype.text = type[row]
        TFtype.resignFirstResponder()
    }
    
    
}


extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
                                    CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
                                                CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    }
