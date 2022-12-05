//
//  Insurance.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 2/12/2022.
//

import Foundation
struct Insurance: Codable {
    
    var _id : String
    var name : String
    var numContrat : String
    var agency : String
    var validityFrom : String
    var validityTo : String
    var carId : String
    var image : String


    init(_id : String ,name: String, numContrat: String, agency: String, validityFrom: String,validityTo: String,carId: String,image: String) {
        self._id = _id
        self.name = name
        self.numContrat = numContrat
        self.agency = agency
        self.validityFrom = validityFrom
        self.validityTo = validityTo
        self.carId = carId
        self.image = image
    }
}
