//
//  HelperConvert.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 11/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved
//

import Foundation
class HelperConvert {
    static func gitHubApiModelToGitHubShow(_ githubApiModel: GithubApiModel) -> ShowGitHubData {
        var showGitHubData : ShowGitHubData = ShowGitHubData()
        showGitHubData.ownerName = githubApiModel.owner.login ?? "No Owner"
        showGitHubData.avatar = githubApiModel.owner.avatarUrl ?? ""
        let files = githubApiModel.files
        if let filesData = files {
            let filesArray = Array(filesData.values)
            let types = filesArray.map{ $0.type }.joined(separator: ",")
            showGitHubData.type = types
        }
        return showGitHubData
    }
}
