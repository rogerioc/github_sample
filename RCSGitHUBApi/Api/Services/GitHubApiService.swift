//
//  GitHubApiService.swift
//  RCSGitHUBApi
//
//  Created by Rogerio on 10/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GitHubApiService {
    
}

extension GitHubApiService: GitHubApiProtocol {
    func getPublicRepositories(page: Int, success: @escaping (_ gitApiModel: GithubApiModel) -> Void, failure: @escaping (_ code: Int?, _ reason: String?) -> Void) {
        var parameters: [String: Any] = [:]
        parameters.updateValue(page, forKey: "page")
        Alamofire.request(GitHubApi.getPublicRepositories(parameters: parameters)).validate().responseJSON { response in
            
            let status = response.response?.statusCode
            switch response.result {
                case .success:
                    let dict = response.result.value as? [String : AnyObject]
                    success(GithubApiModel.init(fromDictionary: dict!))
                case let .failure(error):
                    print(error)
                    failure(status, response.result.description)
            }
        }
    }
}
