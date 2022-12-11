//
//  Constat.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 11/12/2022.
//

import Foundation
struct Constat: Codable {
    
    var _id : String
    var userA : User
    var userB : User
    var carDamageA : carDamage
    var carDamageB : carDamage
    var carA : Car
    var carB : Car
    var InsuranceA : Insurance
    var InsuranceB : Insurance
    

    
    init(_id : String ,userA: User, userB: User, carDamageA: carDamage, carDamageB: carDamage,carA: Car,carB: Car,InsuranceA: Insurance,InsuranceB : Insurance) {
        self._id = _id
        self.userA = userA
        self.userB = userB
        self.carDamageA = carDamageA
        self.carDamageB = carDamageB
        self.carA = carA
        self.carB = carB
        self.InsuranceA = InsuranceA
        self.InsuranceB = InsuranceB
    }
}
