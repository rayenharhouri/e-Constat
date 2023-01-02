//
//  BotResponse.swift
//  e-Constat
//
//  Created by MacBook Pro on 13/12/2022.
//

import Foundation


func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("how to car"){
        return "in the car section press on add new car fill the indormation the press add, congratulation youre car is added 🚗"
    } else if  tempMessage.contains("how to insurance") {
        return "after adding a car press on it , you will see an alerte message in bottom just press it and fill your insurance informations 📜 "
         
    } else if  tempMessage.contains("how to qrcode") {
        return "in the car section you will find a button in the top right with a qr code icon just press it and the other user will scan it to fill your part of the constat"
        
    } else if  tempMessage.contains("how to") {
        return "First You have to create a car , then you add an insurance to that car. In accident cases you data will be automaticly imported then you will scan a qr code to fill the other person data, complete the sketch and boom your constat is ready 🧡"
              
    } else if  tempMessage.contains("more assistance") {
        return "Contact us on our mail : rayen@dev.tn 💬 or you can simply call our assistance service : +216 53 344 511 📞"

    } else {
        return "We are so happy to visit us , Thank you!  "
    }
}

