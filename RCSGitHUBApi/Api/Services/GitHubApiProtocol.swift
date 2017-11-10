//
//  GitHubApiProtocol.swift
//  RCSGitHUBApi
//
//  Created by Rogerio on 10/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation

protocol GitHubApiProtocol {
    func getPublicRepositories(page: Int, success: @escaping (_ gitApiModel: GithubApiModel) -> Void, failure: @escaping (_ code: Int?, _ reason: String?) -> Void)
}
