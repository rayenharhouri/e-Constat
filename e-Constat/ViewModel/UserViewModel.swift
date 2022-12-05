//
//  UserViewModel.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 11/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON



class UserViewModel: ObservableObject {

    static let sharedInstance = UserViewModel()
    
    //login
    func LogIn(email: String,password: String,completed: @escaping (Bool, Any?) -> Void) {
        let parametres: [String: Any] = [
                    "email": email,
                    "password": password
                ]
            AF.request("http://127.0.0.1:3000/user/login",
                   method: .post,
                   parameters: parametres,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    let jsonData = JSON(response.data!)
                    let token = self.getUserToken(jsonItem: jsonData["token"])
                    let utilisateur = self.makeItem(jsonItem: jsonData["user"])
                    print("Meeeeeeeeena")
                    print(token)
                    print("Meeeeeeeeena")
                    print("leeeeeeeeena")
                    print(utilisateur)
                    print("leeeeeeeeena")
                    UserDefaults.standard.setValue(token, forKey: "userToken")
                    print(utilisateur)
                    completed(true,utilisateur)
                    print(completed)
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                    print("/////////////////////")
                    print(error)
                    
                }
            }
    }
    
    //GetUserData
    func getProfil() {
        //Getting the token from userdefault
        let Token = UserDefaults.standard.object(forKey: "userToken") as! String
        let parametres: [String: Any] = [
                    "token": Token
                ]
        AF.request("http://127.0.0.1:3000/user/userProfil", method: .post,
                   parameters: parametres,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    print("success")
                    let jsonData = JSON(response.data!)
                    let utilisateur = self.makeItem(jsonItem: jsonData["user"])
                    
                    
                     do {
                         let encoder = JSONEncoder()
                         
                         let data = try encoder.encode(utilisateur)
                         UserDefaults.standard.setValue(data, forKey: "utilisateur")
                         
                     } catch {
                         print("Unable to encode")
                     }
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    //SignUp
    func SignUp(user: User) {
        let parametres: [String: Any] = [
            "name": user.name,
            "lastName": user.lastName,
            "email": user.email,
            "password": user.password,
            "number": user.number,
            "driverLicense": user.driverLicense,
            "delevredOn": user.delevredOn,
            "adress": user.adress,
        ]
        AF.request("http://127.0.0.1:3000/user/signUp" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
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
    
    
    //SendVerification
    func SendVerification(email: String) {
        let parametres: [String: Any] = [
            "email": email,
        ]
        AF.request("http://127.0.0.1:3000/user/send-confirmation-email" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
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
    
    
    //sendOTP
    func SendOTP(email: String,completed: @escaping (Bool, Any?) -> Void) {
        let parametres: [String: Any] = [
            "email": email,
        ]
        AF.request("http://127.0.0.1:3000/user/forgotPassword" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    completed(true,email)
                    print("success")
                case let .failure(error):
                    completed(false,nil)
                    print(error)
                  
                }
            }
    }
    
    
    //ConfirmOTP
    func confirmOTP(otp: String,completed: @escaping (Bool, Any?) -> Void) {
        let parametres: [String: Any] = [
            "otp": otp,
        ]
        AF.request("http://127.0.0.1:3000/user/confirmationOtp" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    print("success")
                    completed(true,nil)
                case let .failure(error):
                    print(error)
                    completed(false,nil)
                }
            }
    }
    
    func updatePassword(newPassword: String,newPasswordConfirm:String,email:String ,completed: @escaping (Bool, Any?) -> Void) {
        let parametres: [String: Any] = [
            "email" : email,
            "newPassword": newPassword,
            "newPasswordConfirm" : newPasswordConfirm
        ]
        AF.request("http://127.0.0.1:3000/user/updatePassword" , method: .put,parameters:parametres ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    print("success")
                    completed(true,nil)
                case let .failure(error):
                    print(error)
                    completed(false,nil)
                }
            }
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
    func getUserToken(jsonItem: JSON) -> String {
        return jsonItem["token"].stringValue
    }
    
    
    
    func authGoogle(completed: @escaping (Bool, Any?) -> Void) {
        AF.request("http://127.0.0.1:3000/auth/google" , method: .post)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    print("success")
                    completed(true,nil)
                case let .failure(error):
                    print(error)
                    completed(false,nil)
                }
            }
    }
    

    func updateProfil(name: String,lastName:String,driverLicense:String ,completed: @escaping (Bool, Any?) -> Void) {
        let Token = UserDefaults.standard.object(forKey: "userToken") as! String
        let parametres: [String: Any] = [
                    "token": Token,
                    "name": name,
                    "lastName": lastName,
                    "driverLicense": driverLicense
                    
                ]
        AF.request("http://localhost:3000/user/updateUser" , method: .put,parameters:parametres ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    print("success")
                    completed(true,Token)
                case let .failure(error):
                    print(error)
                    completed(false,nil)
                }
            }
    }
    
    func Logout(){
        
        UserDefaults.standard.setValue("", forKey: "userToken")
        print("///////////////")
        let Token = UserDefaults.standard.object(forKey: "userToken") as! String
        print(Token)
    }
   
}

