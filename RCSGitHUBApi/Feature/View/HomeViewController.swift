//
//  HomeViewController.swift
//  RCSGitHUBApi
//
//  Created by Rogerio on 10/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var homeViewModel: HomeViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel = HomeViewModel.init(gitHubApi: GitHubApiService())
        homeViewModel?.publicRepositoriesDelegate = self
        homeViewModel?.getRepositories()
    }
    
}

extension HomeViewController: GetPublicRepositories {
    func repositoriesSuccess(data:GithubApiModel) {
            print(data)
    }
    func repositoriesError(_ error: Int) {
        
    }
    func repositoriesIsLoading(_ loading: Bool) {
        
    }
    func repositoriesIsRefreshing(_ loading: Bool) {
        
    }
}
