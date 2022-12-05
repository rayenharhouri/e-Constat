//
//  InsuranceViewModel.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 2/12/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class InsuranceViewModel: ObservableObject {
    static let sharedInstance = InsuranceViewModel()
    
    //Add New Insurance
    func AddNewInsurance(name: String, numContrat: String, agency: String, validityFrom: String,validityTo: String,carId: String,completed: @escaping (Bool, Any?) -> Void) {
        let parametres: [String: Any] = [
            "name": name,
            "numContrat": numContrat,
            "agency": agency,
            "validityFrom": validityFrom,
            "validityTo" : validityTo,
            "carId": carId
        ]
        AF.request("http://127.0.0.1:3000/insurance/addNew",
                   method: .post,
                   parameters: parametres,encoding: JSONEncoding.default)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
            switch response.result {
            case .success:
                let jsonData = JSON(response.data!)
                //let token = self.getUserToken(jsonItem: jsonData["token"])
                //let car = self.makeCar(jsonItem: jsonData["car"])
                //print(car)
                completed(true,nil)
                print(completed)
            case let .failure(error):
                debugPrint(error)
                completed(false, nil)
                print(error)
                
            }
        }
    }
    func recupererTout(carId : String,completed: @escaping (Bool, Insurance?) -> Void) {
    //Getting the token from userdefault
    
    let parametres: [String: Any] = [
                "carId":carId
            ]
    AF.request("http://127.0.0.1:3000/insurance/getAll", method: .post,
               parameters: parametres,encoding: JSONEncoding.default)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData {
            response in
            switch response.result {
            case .success:
                var insurances : Insurance?
                let singleJsonItem = JSON(response.data!)
                print(singleJsonItem)
                    insurances = makeInsurance(jsonItem: singleJsonItem)
                    print("================")
                    print(singleJsonItem)
                    print("================")
                print("================")
                
                print("================")
                completed(true, insurances)
                print("success")
            case let .failure(error):
                print(error)
            }
        }
}
}
    

func makeInsurance(jsonItem: JSON) -> Insurance {
    return Insurance(
        _id: jsonItem["_id"].stringValue,
        name: jsonItem["name"].stringValue,
        numContrat: jsonItem["numContrat"].stringValue,
        agency: jsonItem["agency"].stringValue,
        validityFrom: jsonItem["validityFrom"].stringValue,
        validityTo: jsonItem["validityTo"].stringValue,
        carId: jsonItem["carId"].stringValue,
        image : jsonItem["image"].stringValue
    )
}
