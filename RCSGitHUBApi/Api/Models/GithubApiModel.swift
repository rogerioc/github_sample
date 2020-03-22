//
//	GithubApiModel.swift
//
//	Create by Rogerio on 10/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
//struct GithubApiModel {
//    var comments : Int!
//    var commentsUrl : String!
//    var commitsUrl : String!
//    var createdAt : String!
//    var descriptionField : String!
//    var files : File!
//    var forksUrl : String!
//    var gitPullUrl : String!
//    var gitPushUrl : String!
//    var htmlUrl : String!
//    var id : String!
//    var owner : Owner!
//    var publicField : Bool!
//    var truncated : Bool!
//    var updatedAt : String!
//    var url : String!
//    var user : AnyObject!
//}

struct GithubApiModel: Codable {
	var comments: Int
    var files: [String:FileInfo]?
	var id: String
	var owner: Owner	
	var url: String
	//var user : AnyObject
}
