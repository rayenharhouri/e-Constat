//
//  User.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 11/11/2022.
//

import Foundation

struct User {
    
    var name : String
    var lastName : String
    var password : String
    var email : String
    var adress : String
    var driverLicense : String
    var delevredOn : String
    var number: Int
    
    init(name: String, password: String, email: String, lastName: String,number: Int,driverLicense: String,delevredOn: String,adress:String) {
        self.name = name
        self.password = password
        self.email = email
        self.lastName = lastName
        self.number = number
        self.driverLicense = driverLicense
        self.delevredOn = delevredOn
        self.adress = adress
    }
    
}
