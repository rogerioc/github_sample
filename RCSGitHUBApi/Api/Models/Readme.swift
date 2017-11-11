//
//	Readme.swift
//
//	Create by Rogerio on 10/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class FileInfo : Mappable{

	var filename : String!
	var language : String!
	var rawUrl : String!
	var size : Int!
	var type : String!

    required init(map: Map) {
        mapping(map: map)
    }
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    func mapping(map: Map) {	
		filename = dictionary["filename"] as? String
		language = dictionary["language"] as? String
		rawUrl = dictionary["raw_url"] as? String
		size = dictionary["size"] as? Int
		type = dictionary["type"] as? String
	}

	
   

}
