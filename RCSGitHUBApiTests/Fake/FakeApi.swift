//
//  FakeApi.swift
//  RCSGitHUBApiTests
//
//  Created by rogerio on 13/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation

class FakeApi: GitHubApiProtocol {
    var successCalled = true
    var fakeApiWasCalled = false
    
    func getPublicRepositories(page: Int, success: @escaping (_ gitApiModel: [GithubApiModel]) -> Void, failure: @escaping (_ code: Int?, _ reason: String?) -> Void) {
        fakeApiWasCalled = true
        if(successCalled) {
            success([])
        }
        else {
            failure(0,"")
        }
    }
}

