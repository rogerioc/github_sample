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
    var persistRepository:PersistRepositoryProtocol?
    var homeCoordinator: HomeCoordinator?
    var page:Int = 0
    weak var publicRepositoriesDelegate:GetPublicRepositories?
    var showGitHubModels: [ShowGitHubData] = []
    
    required init(gitHubApi:GitHubApiProtocol){
        self.gitHubApi = gitHubApi
        //self.persistRepository = persistRepository
    }
    
    func getRepositories() {
        page = 0
        showGitHubModels.removeAll()
        self.persistRepository?.deleteData()
        getData();
    }
    
    func getNextData() {
        page += 1
        getData()
    }
    
    func getData(){
        self.publicRepositoriesDelegate?.repositoriesIsLoading(true)
       
        gitHubApi?.getPublicRepositories(page: page, success: { (gitHubModel) in
            let showGitHubData = gitHubModel.map{ HelperConvert.gitHubApiModelToGitHubShow($0)}
            self.showGitHubModels.append(contentsOf: showGitHubData)
            self.publicRepositoriesDelegate?.repositoriesSuccess(data: self.showGitHubModels)
            self.publicRepositoriesDelegate?.repositoriesIsLoading(false)
            
        }) { (code, reason) in
            self.publicRepositoriesDelegate?.repositoriesError(code ?? 0)
            self.publicRepositoriesDelegate?.repositoriesIsLoading(false)
        }
    }
    
    func selected(atIndex index: Int) {
        homeCoordinator?.navigation(toRoute: .detail(showGitHubModels[index]))
    }
}

