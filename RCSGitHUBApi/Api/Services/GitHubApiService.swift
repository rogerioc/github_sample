//
//  GitHubApiService.swift
//  RCSGitHUBApi
//
//  Created by Rogerio on 10/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation
import Alamofire

class GitHubApiService {
    
}

extension GitHubApiService: GitHubApiProtocol {
    func getPublicRepositories(page: Int, success: @escaping (_ gitApiModel: [GithubApiModel]) -> Void, failure: @escaping (_ code: Int?, _ reason: String?) -> Void) {
        let parameters: [String: Any] = ["page":page]
        Alamofire.request(GitHubApi.getPublicRepositories(parameters: parameters)).validate().responseData { response in
            let status = response.response?.statusCode
            switch response.result {
                case .success:
                        guard let data = response.data else {
                            let error = CustomErros.network(type: .parsing)
                            failure(0, (error as! Error).localizedDescription)
                            return
                        }
                        let decoder = JSONDecoder()
                        do {
                            let gitHubResult = try decoder.decode([GithubApiModel].self, from:  data )
                             success(gitHubResult)
                        } catch {
                            print(error)
                            failure(status, response.result.description)
                        }
                
                case let .failure(error):
                    print(error)
                    failure(status, response.result.description)
            }
        }
    }
}
