//
//  HelperConvert.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 11/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation
class HelperConvert {
    static func gitHubApiModelToGitHubShow(_ githubApiModel: GithubApiModel) -> ShowGitHubData {
        var showGitHubData : ShowGitHubData = ShowGitHubData()
        showGitHubData.ownerName = githubApiModel.owner?.login ?? ""
        showGitHubData.avatar = githubApiModel.owner?.avatarUrl ?? ""
        return showGitHubData
    }
}
