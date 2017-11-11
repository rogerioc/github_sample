//
//  Alerts.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 11/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlerError(title: String, message : String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Alerta", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
