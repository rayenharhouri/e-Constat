//
//  UserViewModel.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 11/11/2022.
//

import Foundation
import Alamofire

class UserViewModel: ObservableObject {

    static let sharedInstance = UserViewModel()
    
    func LogIn(email: String,password: String) {
        let parametres: [String: Any] = [
            "email": email,
            "password": password
        ]
        AF.request("http://127.0.0.1:3000/user/login" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
            .responseJSON {
                (response) in
                switch response.result {
                case .success(let JSON):
                    print("success \(JSON)")
                case .failure(let error):
                    print("request failed \(error)")
                }
            }
        print("email : ",email)
        print("password",password)
            
    }
    
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
    func SendOTP(email: String) {
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
                    print("success")
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    func confirmOTP(otp: String) {
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
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    

}

