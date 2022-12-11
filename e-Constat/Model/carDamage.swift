//
//  carDamage.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 11/12/2022.
//

import Foundation
struct carDamage: Codable {
    
    var _id : String
    var TopLeft : Bool
    var MidLeft : Bool
    var BottomLeft : Bool
    var TopRight : Bool
    var MidRight : Bool
    var BottomRight : Bool
    var carId : String

    
    init(_id : String ,TopLeft: Bool, MidLeft: Bool, BottomLeft: Bool, TopRight: Bool,MidRight: Bool,BottomRight: Bool,carId: String) {
        self._id = _id
        self.TopLeft = TopLeft
        self.MidLeft = MidLeft
        self.BottomLeft = BottomLeft
        self.TopRight = TopRight
        self.MidRight = MidRight
        self.BottomRight = BottomRight
        self.carId = carId
    }
}
