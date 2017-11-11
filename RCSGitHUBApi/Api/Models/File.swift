//
//	File.swift
//
//	Create by Rogerio on 10/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class File : Mappable{

	var fileInfo : FileInfo!

    required init(map: Map) {
        mapping(map: map)
    }
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    func mapping(map: Map) {
        
    }
    

}
