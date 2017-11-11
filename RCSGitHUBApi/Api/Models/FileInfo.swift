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
		filename <- map["filename"]
		language <- map["language"]
		rawUrl <- map["raw_url"]
		size <- map["size"]
		type <- map["type"]
	}

	

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if filename != nil{
			aCoder.encode(filename, forKey: "filename")
		}
		if language != nil{
			aCoder.encode(language, forKey: "language")
		}
		if rawUrl != nil{
			aCoder.encode(rawUrl, forKey: "raw_url")
		}
		if size != nil{
			aCoder.encode(size, forKey: "size")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}

	}

}
