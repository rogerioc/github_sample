//
//  ApiTests.swift
//  RCSGitHUBApiTests
//
//  Created by Rogerio on 13/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Quick
import Nimble
@testable import RCSGitHUBApi

class ApiTests: QuickSpec {
    override func spec() {
        
        describe("a api ") {
            context("static context", {
                
                it("should be url GitGists equal describe url", closure: {
                    expect(GitHubApi.baseURLString).to(equal("https://api.github.com/gists"))
                    expect(GitHubApi.baseURLString).toNot(equal("http:/api.github.com"))
                })
            })
            
            context("url reponse format", {
                let page = ["page":"0"]
                let urlRequest  = try? GitHubApi.getPublicRepositories(parameters: page).asURLRequest()
                it("should return a urlRequest", closure: {
                    expect(urlRequest).to(beAKindOf(URLRequest.self))
                })
                
                it("should be equal a absolute url", closure: {
                    expect(urlRequest?.url?.absoluteString).to(equal("https://api.github.com/gists/public?page=0"))
                })
            })
        }
    }
    
}

