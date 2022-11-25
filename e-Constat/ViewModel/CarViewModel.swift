//
//  CarViewModel.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 25/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class CarViewModel: ObservableObject {
    static let sharedInstance = CarViewModel()
    
    //Add New Car
    func AddNewCar(brand: String,type: String,numSerie: String,fiscalPower : Int,numImma : String,userToken : String,completed: @escaping (Bool, Any?) -> Void) {
        let parametres: [String: Any] = [
                    "brand": brand,
                    "type": type,
                    "numSerie": numSerie,
                    "fiscalPower": fiscalPower,
                    "numImmatriculation": numImma,
                    "token": userToken,
                ]
            AF.request("http://127.0.0.1:3000/car/addNew",
                   method: .post,
                   parameters: parametres,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    //let token = self.getUserToken(jsonItem: jsonData["token"])
                    let car = self.makeCar(jsonItem: jsonData["car"])
                    print(car)
                    completed(true,car)
                    print(completed)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                    print(error)
                    
                }
            }
    }
    func makeCar(jsonItem: JSON) -> Car {
        return Car(
            _id: jsonItem["_id"].stringValue,
            brand: jsonItem["brand"].stringValue,
            type: jsonItem["type"].stringValue,
            numSerie: jsonItem["numSerie"].stringValue,
            fiscalPower: jsonItem["fiscalPower"].intValue,
            numImm: jsonItem["numImmatriculation"].stringValue,
            owner : jsonItem["owner"].stringValue,
            carIcon : jsonItem["carImage"].stringValue
        )
    }
    
}
