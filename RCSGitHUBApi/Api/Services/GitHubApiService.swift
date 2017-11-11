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
import ObjectMapper

class GitHubApiService {
    
}

extension GitHubApiService: GitHubApiProtocol {
    func getPublicRepositories(page: Int, success: @escaping (_ gitApiModel: [GithubApiModel]) -> Void, failure: @escaping (_ code: Int?, _ reason: String?) -> Void) {
        let parameters: [String: Any] = ["page":page]
        Alamofire.request(GitHubApi.getPublicRepositories(parameters: parameters)).validate().responseJSON { response in
            let status = response.response?.statusCode
            switch response.result {
                case .success:
                    if let json =  response.result.value as? [[String : Any]] {
                        let gitHubResult =  Mapper<GithubApiModel>().mapArray(JSONArray: json)
                        print(gitHubResult)
                        success(gitHubResult)
                    }
                
                case let .failure(error):
                    print(error)
                    failure(status, response.result.description)
            }
        }
    }
}
