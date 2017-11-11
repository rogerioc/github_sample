//
//	GithubApiModel.swift
//
//	Create by Rogerio on 10/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper
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

class GithubApiModel : Mappable {

	var comments : Int!
	var commentsUrl : String!
	var commitsUrl : String!
	var createdAt : String!
	var descriptionField : String!
	var files : File!
	var forksUrl : String!
	var gitPullUrl : String!
	var gitPushUrl : String!
	var htmlUrl : String!
	var id : String!
	var owner : Owner!
	var publicField : Bool!
	var truncated : Bool!
	var updatedAt : String!
	var url : String!
	var user : AnyObject!

    required init(map: Map) {
        mapping(map: map)
    }
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    func mapping(map: Map) {
        comments <- map["comments"]
        commentsUrl <- map["comments_url"]
        commitsUrl <- map["commits_url"]
        createdAt <- map["created_at"]
        descriptionField <- map["description"]
        files <- map["files"]
        forksUrl <- map["forks_url"]
        gitPullUrl <- map["git_pull_url"]
        gitPushUrl <- map["git_push_url"]
        htmlUrl <- map["html_url"]
        id <- map["id"]
        owner <- map["owner"]
        publicField <- map["public"]
        truncated <- map["truncated"]
        updatedAt <- map["updated_at"]
        url <- map["url"]
        user <- map["user"]
    }    

	

    

}
