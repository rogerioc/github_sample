//
//  RepoViewCell.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 11/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//


import UIKit

class RepoViewCell: UITableViewCell,ReusableView,NibLoadableView  {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var avatar: UIImageView!

    
    func setup(showGitHubData:ShowGitHubData) {
        name.text = showGitHubData.ownerName
        type.text = ""
    }
    
}
