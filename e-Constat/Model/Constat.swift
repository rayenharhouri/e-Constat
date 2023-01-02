//
//  Constat.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 11/12/2022.
//

import Foundation

struct Constat: Codable {
    var _id : String
    var userA : String
    var userB : String
    var carDamageA : String
    var carDamageB : String
    var carA : String
    var carB : String
    var InsuranceA : String
    var InsuranceB : String
    

    
    init(_id : String ,userA: String, userB: String, carDamageA: String, carDamageB: String,carA: String,carB: String,InsuranceA: String,InsuranceB : String) {
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
