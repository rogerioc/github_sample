//
//  UITableView+Extension.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 11/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import UIKit

//Extension para facilitar a criação de tableViews, agilizando o registro d e o reuso as celulas
extension UITableView {
    
    func register<T: UITableViewCell>(_:T.Type) where T : ReusableView {
       register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UITableViewCell>(_:T.Type) where T: ReusableView, T : NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
}
