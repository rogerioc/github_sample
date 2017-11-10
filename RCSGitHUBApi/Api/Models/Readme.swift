//
//	Readme.swift
//
//	Create by Rogerio on 10/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Readme : NSObject, NSCoding{

	var filename : String!
	var language : String!
	var rawUrl : String!
	var size : Int!
	var type : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		filename = dictionary["filename"] as? String
		language = dictionary["language"] as? String
		rawUrl = dictionary["raw_url"] as? String
		size = dictionary["size"] as? Int
		type = dictionary["type"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if filename != nil{
			dictionary["filename"] = filename
		}
		if language != nil{
			dictionary["language"] = language
		}
		if rawUrl != nil{
			dictionary["raw_url"] = rawUrl
		}
		if size != nil{
			dictionary["size"] = size
		}
		if type != nil{
			dictionary["type"] = type
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         filename = aDecoder.decodeObject(forKey: "filename") as? String
         language = aDecoder.decodeObject(forKey: "language") as? String
         rawUrl = aDecoder.decodeObject(forKey: "raw_url") as? String
         size = aDecoder.decodeObject(forKey: "size") as? Int
         type = aDecoder.decodeObject(forKey: "type") as? String

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
