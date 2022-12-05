//
//  Car.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 25/11/2022.
//

import Foundation
struct Car: Codable {
    
    var _id : String
    var brand : String
    var type : String
    var numSerie : String
    var fiscalPower : Int
    var numImm : String
    var owner : String
    var carIcon : String

    
    init(_id : String ,brand: String, type: String, numSerie: String, fiscalPower: Int,numImm: String,owner: String,carIcon: String) {
        self._id = _id
        self.brand = brand
        self.type = type
        self.numSerie = numSerie
        self.fiscalPower = fiscalPower
        self.numImm = numImm
        self.owner = owner
        self.carIcon = carIcon
    }
}
