//
//	Owner.swift
//
//	Create by Rogerio on 10/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Owner : NSObject, NSCoding{

	var avatarUrl : String!
	var eventsUrl : String!
	var followersUrl : String!
	var followingUrl : String!
	var gistsUrl : String!
	var gravatarId : String!
	var htmlUrl : String!
	var id : Int!
	var login : String!
	var organizationsUrl : String!
	var receivedEventsUrl : String!
	var reposUrl : String!
	var siteAdmin : Bool!
	var starredUrl : String!
	var subscriptionsUrl : String!
	var type : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		avatarUrl = dictionary["avatar_url"] as? String
		eventsUrl = dictionary["events_url"] as? String
		followersUrl = dictionary["followers_url"] as? String
		followingUrl = dictionary["following_url"] as? String
		gistsUrl = dictionary["gists_url"] as? String
		gravatarId = dictionary["gravatar_id"] as? String
		htmlUrl = dictionary["html_url"] as? String
		id = dictionary["id"] as? Int
		login = dictionary["login"] as? String
		organizationsUrl = dictionary["organizations_url"] as? String
		receivedEventsUrl = dictionary["received_events_url"] as? String
		reposUrl = dictionary["repos_url"] as? String
		siteAdmin = dictionary["site_admin"] as? Bool
		starredUrl = dictionary["starred_url"] as? String
		subscriptionsUrl = dictionary["subscriptions_url"] as? String
		type = dictionary["type"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if avatarUrl != nil{
			dictionary["avatar_url"] = avatarUrl
		}
		if eventsUrl != nil{
			dictionary["events_url"] = eventsUrl
		}
		if followersUrl != nil{
			dictionary["followers_url"] = followersUrl
		}
		if followingUrl != nil{
			dictionary["following_url"] = followingUrl
		}
		if gistsUrl != nil{
			dictionary["gists_url"] = gistsUrl
		}
		if gravatarId != nil{
			dictionary["gravatar_id"] = gravatarId
		}
		if htmlUrl != nil{
			dictionary["html_url"] = htmlUrl
		}
		if id != nil{
			dictionary["id"] = id
		}
		if login != nil{
			dictionary["login"] = login
		}
		if organizationsUrl != nil{
			dictionary["organizations_url"] = organizationsUrl
		}
		if receivedEventsUrl != nil{
			dictionary["received_events_url"] = receivedEventsUrl
		}
		if reposUrl != nil{
			dictionary["repos_url"] = reposUrl
		}
		if siteAdmin != nil{
			dictionary["site_admin"] = siteAdmin
		}
		if starredUrl != nil{
			dictionary["starred_url"] = starredUrl
		}
		if subscriptionsUrl != nil{
			dictionary["subscriptions_url"] = subscriptionsUrl
		}
		if type != nil{
			dictionary["type"] = type
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         avatarUrl = aDecoder.decodeObject(forKey: "avatar_url") as? String
         eventsUrl = aDecoder.decodeObject(forKey: "events_url") as? String
         followersUrl = aDecoder.decodeObject(forKey: "followers_url") as? String
         followingUrl = aDecoder.decodeObject(forKey: "following_url") as? String
         gistsUrl = aDecoder.decodeObject(forKey: "gists_url") as? String
         gravatarId = aDecoder.decodeObject(forKey: "gravatar_id") as? String
         htmlUrl = aDecoder.decodeObject(forKey: "html_url") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         login = aDecoder.decodeObject(forKey: "login") as? String
         organizationsUrl = aDecoder.decodeObject(forKey: "organizations_url") as? String
         receivedEventsUrl = aDecoder.decodeObject(forKey: "received_events_url") as? String
         reposUrl = aDecoder.decodeObject(forKey: "repos_url") as? String
         siteAdmin = aDecoder.decodeObject(forKey: "site_admin") as? Bool
         starredUrl = aDecoder.decodeObject(forKey: "starred_url") as? String
         subscriptionsUrl = aDecoder.decodeObject(forKey: "subscriptions_url") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if avatarUrl != nil{
			aCoder.encode(avatarUrl, forKey: "avatar_url")
		}
		if eventsUrl != nil{
			aCoder.encode(eventsUrl, forKey: "events_url")
		}
		if followersUrl != nil{
			aCoder.encode(followersUrl, forKey: "followers_url")
		}
		if followingUrl != nil{
			aCoder.encode(followingUrl, forKey: "following_url")
		}
		if gistsUrl != nil{
			aCoder.encode(gistsUrl, forKey: "gists_url")
		}
		if gravatarId != nil{
			aCoder.encode(gravatarId, forKey: "gravatar_id")
		}
		if htmlUrl != nil{
			aCoder.encode(htmlUrl, forKey: "html_url")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if login != nil{
			aCoder.encode(login, forKey: "login")
		}
		if organizationsUrl != nil{
			aCoder.encode(organizationsUrl, forKey: "organizations_url")
		}
		if receivedEventsUrl != nil{
			aCoder.encode(receivedEventsUrl, forKey: "received_events_url")
		}
		if reposUrl != nil{
			aCoder.encode(reposUrl, forKey: "repos_url")
		}
		if siteAdmin != nil{
			aCoder.encode(siteAdmin, forKey: "site_admin")
		}
		if starredUrl != nil{
			aCoder.encode(starredUrl, forKey: "starred_url")
		}
		if subscriptionsUrl != nil{
			aCoder.encode(subscriptionsUrl, forKey: "subscriptions_url")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}