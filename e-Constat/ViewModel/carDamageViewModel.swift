//
//  carDamageViewModel.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 11/12/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class carDamageViewModel: ObservableObject {
    
    static let sharedInstance = carDamageViewModel()
    
    //login
    func addNew(TopLeft: Bool,MidLeft: Bool,BottomLeft : Bool,TopRight : Bool,MidRight: Bool,bottomRight: Bool,carId:String,completed: @escaping (Bool, Any?) -> Void) {
        let parametres: [String: Any] = [
            "TopLeft" : TopLeft,
            "MidLeft" : MidLeft,
            "BottomLeft" : BottomLeft,
            "TopRight" :  TopRight,
            "MidRight" : MidRight,
            "BottomRight" : bottomRight,
            "carId" : carId
        ]
        AF.request("http://127.0.0.1:3000/carDamage/addNew",
                   method: .post,
                   parameters: parametres,encoding: JSONEncoding.default)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
            switch response.result {
            case .success:
                let jsonData = JSON(response.data!)
                let carDamage = self.makeCarDamage(jsonItem: jsonData["carDamage"])
                completed(true,carDamage)
                print(completed)
            case let .failure(error):
                completed(false, nil)
                print(error)
                
            }
        }
    }
    func makeCarDamage(jsonItem: JSON) -> carDamage {
        return carDamage(
            _id: jsonItem["_id"].stringValue,
            TopLeft: jsonItem["TopLeft"].boolValue,
            MidLeft: jsonItem["MidLeft"].boolValue,
            BottomLeft: jsonItem["BottomLeft"].boolValue,
            TopRight: jsonItem["TopRight"].boolValue,
            MidRight: jsonItem["MidRight"].boolValue,
            BottomRight : jsonItem["BottomRight"].boolValue,
            carId : jsonItem["carId"].stringValue
        )
    }

}
