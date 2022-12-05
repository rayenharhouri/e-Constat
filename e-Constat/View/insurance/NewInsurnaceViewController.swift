//
//  NewInsuranceViewController.swift
//  e-Constat
//
//  Created by MacBook Pro on 04/12/2022.
//

import UIKit

class NewInsuranceViewController: UIViewController {
    
    
    let type = ["ami","star","comar","hayet"]
    var currentCar : Car?
    
    var typePickerView = UIPickerView()
    
    @IBOutlet weak var TFName: UITextField!
    
    @IBOutlet weak var TFnumContrat: UITextField!
    @IBOutlet weak var TFAgency: UITextField!
    @IBOutlet weak var VToOutlet: UIDatePicker!
    @IBOutlet weak var VFromOutlet: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        TFName.inputView = typePickerView
        TFName.textAlignment = .center
        typePickerView.delegate = self
        typePickerView.dataSource = self
    }
    
    @IBAction func SubmitInsurnace(_ sender: Any) {
        InsuranceViewModel.sharedInstance.AddNewInsurance(name: TFName.text ?? "", numContrat: TFnumContrat.text ?? "", agency: TFAgency.text ?? "", validityFrom: DateUtils.formatFromDate(date: VFromOutlet.date), validityTo: DateUtils.formatFromDate(date: VToOutlet.date), carId: currentCar!._id) { (success, reponse) in
            if success {
                self.present(Alert.makeAlert(titre: "Succcess", message: "Insurance Added"), animated: true)
            } else {
                self.present(Alert.makeAlert(titre: "Warning", message: "Incorrect Inputs"), animated: true)
            }
        }
    }
    
    
}

extension NewInsuranceViewController: UIPickerViewDataSource,UIPickerViewDelegate {
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
        TFName.text = type[row]
        TFName.resignFirstResponder()
    }
    
    
    
}
