//
//  InfoViewController.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 11/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation
import UIKit
class InfoViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var avatar: UIImageView!
    var showGitHubData:ShowGitHubData!
    
    @IBOutlet weak var typeTextArea: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = self.showGitHubData.ownerName
        typeTextArea.text = self.showGitHubData.type
        avatar.download(image: self.showGitHubData.avatar)
    }
}
