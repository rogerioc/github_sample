//
//  ReusableView.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 11/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import UIKit

protocol ReusableView : class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
