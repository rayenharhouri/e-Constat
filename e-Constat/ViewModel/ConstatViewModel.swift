//
//  ConstatViewModel.swift
//  e-Constat
//
//  Created by MacBook Pro on 10/12/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class ConstatViewModel: ObservableObject {
    static let sharedInstance = ConstatViewModel()
    
    func recupererTout(ids : String,completed: @escaping (Bool, Any?) -> Void) {
        let parametres: [String: Any] = [
                    "ids": ids
                ]
        AF.request("http://127.0.0.1:3000/car/getUserBdata", method: .post,
                   parameters: parametres,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    var list : [Any] = []
                    var cars : Car?
                    var user : User?
                    var insurance : Insurance?
                    let singleJsonItem = JSON(response.data!)
                        print("================")
                        cars = self.makeCar(jsonItem: singleJsonItem["car"])
                        user = self.makeItem(jsonItem: singleJsonItem["user"])
                        insurance = self.makeInsurance(jsonItem: singleJsonItem["Insurance"])
                        print(singleJsonItem)
                        print("================")
                    list = [cars!,user!,insurance!]
                    
                    print("=Car=")
                    print(cars!)
                    print("================")
                    print("=User=")
                    print(user!)
                    print("================")
                    print("=insurance=")
                    print(insurance!)
                    print("================")
                    completed(true, list)
                    print("success")
                    
                    
                case let .failure(error):
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
    
    func makeItem(jsonItem: JSON) -> User {
        return User(
            _id: jsonItem["_id"].stringValue,
            name: jsonItem["name"].stringValue,
            password: jsonItem["password"].stringValue,
            email: jsonItem["email"].stringValue,
            lastName: jsonItem["lastName"].stringValue,
            number: jsonItem["number"].intValue,
            driverLicense: jsonItem["driverLicense"].stringValue,
            delevredOn: "02-02-2020",
            adress: jsonItem["adress"].stringValue,
            verified: jsonItem["verified"].boolValue
        )
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
    
    
    
    
}
