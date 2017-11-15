//
//  GistsListTests.swift
//  RCSGitHUBApiTests
//
//  Created by rogerio on 13/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Quick
import Nimble
import ObjectMapper
@testable import RCSGitHUBApi

class GistsListTests: QuickSpec {
    class FakeApi: GitHubApiProtocol {
        var successCalled = true
        var fakeApiWasCalled = false
        var fakeResult:[GithubApiModel]?
        
        func getPublicRepositories(page: Int, success: @escaping (_ gitApiModel: [GithubApiModel]) -> Void, failure: @escaping (_ code: Int?, _ reason: String?) -> Void) {
            fakeApiWasCalled = true
            if(successCalled) {
                success((fakeResult ?? [])!)
            }
            else {
                failure(0,"")
            }
        }
    }
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
            describe(".fetchGists") {
                var cell: RepoViewCell!
                var fakeApi = FakeApi()
                var showGitHubModels:[ShowGitHubData]?
                
                beforeEach {
                    fakeApi.successCalled = true
                    let jsonGists =  HelperData.getFile(name: "gists")
                    fakeApi.fakeResult = Mapper<GithubApiModel>().mapArray(JSONString: jsonGists)
                    showGitHubModels = fakeApi.fakeResult?.map{ HelperConvert.gitHubApiModelToGitHubShow($0)}
                    controller.homeViewModel = HomeViewModel.init(gitHubApi: fakeApi)
                    controller.viewDidLoad()
                      cell = controller.tableView(controller.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! RepoViewCell
                }
                context("Gists are fetched successfully") {
                    it("sets the gists as the data source") {
                        expect(fakeApi.fakeApiWasCalled).to(beTrue())
                    expect(controller.showGitHubDatas).to(containElementSatisfying({ showGitHubModel in
                        return (showGitHubModel.avatar == showGitHubModels![0].avatar)
                        }))
                        
                    }
                }
                it("should show gists data") {
                    expect(cell.name?.text).to(equal(showGitHubModels![0].ownerName))
                    expect(cell.type?.text).to(equal(showGitHubModels![0].type))
                }
            }
        }
    }
 }

