//
//  HomeCoordinator.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 23/04/20.
//  Copyright © 2020 rogeriocs. All rights reserved.
//

import Foundation
import UIKit

public class HomeCoordinator: Coordinator, Navigator {
        
    // MARK: Properties
    private var navigationController: UINavigationController

    enum Route {
        case detail(ShowGitHubData)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Methods
    
    func navigation(toRoute route: Route) {
        switch route {
        case .detail(let showGitHubData):
            let info = InfoViewController()
            let infoViewModel = InfoViewModel(showGitHubData: showGitHubData)
            info.viewModel = infoViewModel
            self.navigationController.pushViewController(info, animated: true)
        }
    }
    
    func start() {
        
        let homeViewController = HomeViewController()
        let homeViewModel = HomeViewModel(gitHubApi: GitHubApiService())
        homeViewController.homeViewModel = homeViewModel
        homeViewModel.homeCoordinator = self
        self.navigationController.setViewControllers([homeViewController], animated: false)
    }
}
