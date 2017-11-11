//
//  HomeViewModelProtocol.swift
//  RCSGitHUBApi
//
//  Created by Rogerio on 10/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation
protocol HomeViewModelProtocol {
    weak var publicRepositoriesDelegate:GetPublicRepositories? {get set}
    func getRepositories()
}

protocol GetPublicRepositories: class {
    func repositoriesSuccess(data:[ShowGitHubData])
    func repositoriesError(_ error: Int)
    func repositoriesIsLoading(_ loading: Bool)
    func repositoriesIsRefreshing(_ loading: Bool)
}
