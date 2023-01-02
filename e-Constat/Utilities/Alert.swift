//
//  Alert.swift
//  e-Constat
//
//  Created by MacBook Pro on 13/12/2022.
//

import Foundation
import UIKit

public class Alert {
    
    static func makeAlert(titre: String?, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        return alert
    }
    
    static func makeActionAlert(titre: String?, message: String?, action: UIAlertAction) -> UIAlertController {
        let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        alert.addAction(action)
        return(alert)
    }
    
    static func makeSingleActionAlert(titre: String?, message: String?, action: UIAlertAction) -> UIAlertController {
        let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
        alert.addAction(action)
        return(alert)
    }
    
    static func makeServerErrorAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: "Internal server error", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        return(alert)
    }
}

