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
    func AddNewConstat(userA: String,carA: String,insuranceA: String,carDamageA: String,completed: @escaping (Bool, Any?) -> Void) {
        let parametres: [String: Any] = [
                "UserA" : userA,
                "CarA" : carA,
                "InsuranceA" : insuranceA,
                "CarDamageA" : carDamageA
                ]
            AF.request("http://127.0.0.1:3000/constat/addNew",
                   method: .post,
                   parameters: parametres,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    //let token = self.getUserToken(jsonItem: jsonData["token"])
                    let constat = self.makeConstat(jsonItem: jsonData["constat"])
                    print(constat)
                    completed(true,constat._id)
                    print(completed)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                    print(error)
                }
            }
    }
    func AddNewConstatB(userB: String,carB: String,insuranceB: String,constatId : String,completed: @escaping (Bool, Any?) -> Void) {
        let parametres: [String: Any] = [
                "constatId" : constatId,
                "UserB" : userB,
                "CarB" : carB,
                "InsuranceB" : insuranceB
                ]
            AF.request("http://127.0.0.1:3000/constat/addNewB",
                   method: .post,
                   parameters: parametres,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    //let token = self.getUserToken(jsonItem: jsonData["token"])
                    let constat = self.makeConstat(jsonItem: jsonData["constat"])
                    print(constat)
                    completed(true,constat._id)
                    print(completed)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                    print(error)
                }
            }
    }

    func recupererTout(idU : String,completed: @escaping (Bool, [String]?) -> Void) {
        //Getting the token from userdefault
        let parametres: [String: Any] = [
                    "idU": idU
                ]
        AF.request("http://127.0.0.1:3000/constat/get", method: .post,
                   parameters: parametres,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    var cars : [String]? = []
                    
                    let jsonData = JSON(response.data!)
                    for signleItem in jsonData{
                        let string = "\(signleItem.0) : \(signleItem.1)"
                        cars?.append(string)
                       print(string)
                    }
                    print("================")
                    print(cars)
                    print("================")
                    completed(true, cars)
                    print("success")
                    
                    
                case let .failure(error):
                    print(error)
                }
            }
    }
    func SendMail(email: String) {
        let parametres: [String: Any] = [
            "email": email,
        ]
        AF.request("http://127.0.0.1:3000/constat/sendReport" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    print("success")
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    func makeConstat(jsonItem: JSON) -> Constat {
        return Constat(
                       _id: jsonItem["_id"].stringValue,
                       userA: jsonItem["UserA"].stringValue,
                       userB: jsonItem["UserB"].stringValue,
                       carDamageA: jsonItem["carDamageA"].stringValue,
                       carDamageB: jsonItem["carDamageB"].stringValue,
                       carA: jsonItem["carA"].stringValue,
                       carB: jsonItem["carB"].stringValue,
                       InsuranceA: jsonItem["InsuranceA"].stringValue,
                       InsuranceB: jsonItem["InsuranceB"].stringValue
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
