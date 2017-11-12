//
//  UIImageView+Kingfisher.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 11/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func download(image url: String) {
        if let imageURL = URL(string:url) {
            self.kf.setImage(with: ImageResource(downloadURL: imageURL))
        }
    }
}
