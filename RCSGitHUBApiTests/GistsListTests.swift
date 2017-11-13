//
//  GistsListTests.swift
//  RCSGitHUBApiTests
//
//  Created by rogerio on 13/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Quick
import Nimble
@testable import RCSGitHUBApi

class GistsListTests: QuickSpec {
    
    override func spec() {
        
        describe("gists TableViewController") {
            
            var controller : HomeViewController!
            
            beforeEach {
                let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                let navigation = storyboard.instantiateInitialViewController() as! UINavigationController
                controller = navigation.viewControllers.first as! HomeViewController
                controller.viewDidLoad()
            }
            
            it("should be able to create a controller") {
                expect(controller).toNot(beNil())
            }
            
            it("should have a view of type") {
                expect(controller).to(beAKindOf(HomeViewController.self))
            }
            
            context("static context", {
                
                it("should not be null", closure: {
                    expect(controller.load).toNot(beNil())
                    expect(controller.showGitHubDatas).toNot(beNil())
                    expect(controller.tableView.refreshControl).toNot(beNil())
                })
                
                it("should not be null", closure: {
                    expect(controller.load).to(equal(true))
                    
                })
                
            })
        }
    }
}
