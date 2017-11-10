//
//  HomeViewModel.swift
//  RCSGitHUBApi
//
//  Created by Rogerio on 10/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol{
    var gitHubApi : GitHubApiProtocol?
    weak var publicRepositoriesDelegate:GetPublicRepositories?
    
    required init(gitHubApi: GitHubApiProtocol){
        self.gitHubApi = gitHubApi
    }
    
    func getRepositories() {
        gitHubApi?.getPublicRepositories(page: 0, success: { (gitHubModel) in
            self.publicRepositoriesDelegate?.repositoriesSuccess(data: gitHubModel)
        }) { (code, reason) in
            self.publicRepositoriesDelegate?.repositoriesError(code!)
        }
    }
}

