//
//	File.swift
//
//	Create by Rogerio on 10/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class File : NSObject, NSCoding{

	var readmemd : Readme!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let readmemdData = dictionary["Readme"] as? [String:Any]{
			readmemd = Readme(fromDictionary: readmemdData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if readmemd != nil{
			dictionary["Readme"] = readmemd.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         readmemd = aDecoder.decodeObject(forKey: "Readme") as? Readme

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if readmemd != nil{
			aCoder.encode(readmemd, forKey: "Readme")
		}

	}

}
