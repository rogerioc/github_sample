//
//  UIColor.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 22/03/20.
//  Copyright © 2020 rogeriocs. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public class var primary: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "primary", in: Bundle.main, compatibleWith: nil)!
        }else {
            return #colorLiteral(red: 0.04476380654, green: 0.7417043584, blue: 1, alpha: 1)
        }
    }
    
    public class var basic: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "basic", in: Bundle.main, compatibleWith: nil)!
        }else {
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}
