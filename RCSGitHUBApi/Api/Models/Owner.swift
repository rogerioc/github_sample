//
//	Owner.swift
//
//	Create by Rogerio on 10/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Owner : Codable{
	var avatarUrl: String
	var eventsUrl: String
	var followersUrl: String
	var followingUrl: String
	var gistsUrl: String
	var gravatarId: String
	var htmlUrl: String
	var id: Int
	var login: String
	var organizationsUrl: String
	var receivedEventsUrl: String
	var reposUrl: String
	var siteAdmin: Bool
	var starredUrl: String
	var subscriptionsUrl: String
	var type: String
	var url: String
    
    enum CodingKeys: String, CodingKey {
		case avatarUrl = "avatar_url"
		case eventsUrl = "events_url"
		case followersUrl = "followers_url"
		case followingUrl = "following_url"
		case gistsUrl = "gists_url"
		case gravatarId  = "gravatar_id"
		case htmlUrl = "html_url"
		case id  = "id"
		case login = "login"
		case organizationsUrl = "organizations_url"
		case receivedEventsUrl = "received_events_url"
		case reposUrl  = "repos_url"
		case siteAdmin = "site_admin"
		case starredUrl = "starred_url"
		case subscriptionsUrl = "subscriptions_url"
		case type = "type"
		case url = "url"
	}
	  

}
