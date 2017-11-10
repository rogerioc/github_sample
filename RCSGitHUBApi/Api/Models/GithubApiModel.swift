//
//	GithubApiModel.swift
//
//	Create by Rogerio on 10/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class GithubApiModel : NSObject, NSCoding{

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


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		comments = dictionary["comments"] as? Int
		commentsUrl = dictionary["comments_url"] as? String
		commitsUrl = dictionary["commits_url"] as? String
		createdAt = dictionary["created_at"] as? String
		descriptionField = dictionary["description"] as? String
		if let filesData = dictionary["files"] as? [String:Any]{
			files = File(fromDictionary: filesData)
		}
		forksUrl = dictionary["forks_url"] as? String
		gitPullUrl = dictionary["git_pull_url"] as? String
		gitPushUrl = dictionary["git_push_url"] as? String
		htmlUrl = dictionary["html_url"] as? String
		id = dictionary["id"] as? String
		if let ownerData = dictionary["owner"] as? [String:Any]{
			owner = Owner(fromDictionary: ownerData)
		}
		publicField = dictionary["public"] as? Bool
		truncated = dictionary["truncated"] as? Bool
		updatedAt = dictionary["updated_at"] as? String
		url = dictionary["url"] as? String
		user = dictionary["user"] as? AnyObject
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if comments != nil{
			dictionary["comments"] = comments
		}
		if commentsUrl != nil{
			dictionary["comments_url"] = commentsUrl
		}
		if commitsUrl != nil{
			dictionary["commits_url"] = commitsUrl
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if files != nil{
			dictionary["files"] = files.toDictionary()
		}
		if forksUrl != nil{
			dictionary["forks_url"] = forksUrl
		}
		if gitPullUrl != nil{
			dictionary["git_pull_url"] = gitPullUrl
		}
		if gitPushUrl != nil{
			dictionary["git_push_url"] = gitPushUrl
		}
		if htmlUrl != nil{
			dictionary["html_url"] = htmlUrl
		}
		if id != nil{
			dictionary["id"] = id
		}
		if owner != nil{
			dictionary["owner"] = owner.toDictionary()
		}
		if publicField != nil{
			dictionary["public"] = publicField
		}
		if truncated != nil{
			dictionary["truncated"] = truncated
		}
		if updatedAt != nil{
			dictionary["updated_at"] = updatedAt
		}
		if url != nil{
			dictionary["url"] = url
		}
		if user != nil{
			dictionary["user"] = user
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         comments = aDecoder.decodeObject(forKey: "comments") as? Int
         commentsUrl = aDecoder.decodeObject(forKey: "comments_url") as? String
         commitsUrl = aDecoder.decodeObject(forKey: "commits_url") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         files = aDecoder.decodeObject(forKey: "files") as? File
         forksUrl = aDecoder.decodeObject(forKey: "forks_url") as? String
         gitPullUrl = aDecoder.decodeObject(forKey: "git_pull_url") as? String
         gitPushUrl = aDecoder.decodeObject(forKey: "git_push_url") as? String
         htmlUrl = aDecoder.decodeObject(forKey: "html_url") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         owner = aDecoder.decodeObject(forKey: "owner") as? Owner
         publicField = aDecoder.decodeObject(forKey: "public") as? Bool
         truncated = aDecoder.decodeObject(forKey: "truncated") as? Bool
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String
         user = aDecoder.decodeObject(forKey: "user") as? AnyObject

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if comments != nil{
			aCoder.encode(comments, forKey: "comments")
		}
		if commentsUrl != nil{
			aCoder.encode(commentsUrl, forKey: "comments_url")
		}
		if commitsUrl != nil{
			aCoder.encode(commitsUrl, forKey: "commits_url")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if files != nil{
			aCoder.encode(files, forKey: "files")
		}
		if forksUrl != nil{
			aCoder.encode(forksUrl, forKey: "forks_url")
		}
		if gitPullUrl != nil{
			aCoder.encode(gitPullUrl, forKey: "git_pull_url")
		}
		if gitPushUrl != nil{
			aCoder.encode(gitPushUrl, forKey: "git_push_url")
		}
		if htmlUrl != nil{
			aCoder.encode(htmlUrl, forKey: "html_url")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if owner != nil{
			aCoder.encode(owner, forKey: "owner")
		}
		if publicField != nil{
			aCoder.encode(publicField, forKey: "public")
		}
		if truncated != nil{
			aCoder.encode(truncated, forKey: "truncated")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if user != nil{
			aCoder.encode(user, forKey: "user")
		}

	}

}