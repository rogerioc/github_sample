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
        self.publicRepositoriesDelegate?.repositoriesIsLoading(true)
        gitHubApi?.getPublicRepositories(page: 0, success: { (gitHubModel) in
            let showGitHubModels = gitHubModel.map{ HelperConvert.gitHubApiModelToGitHubShow($0)}
            self.publicRepositoriesDelegate?.repositoriesSuccess(data: showGitHubModels)
            self.publicRepositoriesDelegate?.repositoriesIsLoading(false)
        }) { (code, reason) in
            self.publicRepositoriesDelegate?.repositoriesError(code!)
            self.publicRepositoriesDelegate?.repositoriesIsLoading(false)
        }
    }
}

