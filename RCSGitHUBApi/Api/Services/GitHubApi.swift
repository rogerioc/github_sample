//
//  GitHubApi.swift
//  RCSGitHUBApi
//
//  Created by Rogerio on 10/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation
import Alamofire

enum GitHubApi: URLRequestConvertible {   
    static let baseURLString = "https://api.github.com/gists"
    case getPublicRepositories(parameters: Parameters)
    var method: HTTPMethod {
        switch self {
        case .getPublicRepositories:
            return .get
        }
    }
    var path: String {
        switch self {
        case .getPublicRepositories:
            return "/public"
        }
    }
    func asURLRequest() throws -> URLRequest {
        let url = try GitHubApi.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case let .getPublicRepositories(parameters):
            urlRequest = try Alamofire.JSONEncoding.default.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
}
