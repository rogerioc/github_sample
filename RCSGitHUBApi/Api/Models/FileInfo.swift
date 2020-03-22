//
//	Readme.swift
//
//	Create by Rogerio on 10/11/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct FileInfo: Codable{

	var filename: String
	var language: String?
	var rawUrl: String
	var size: Int
	var type: String

    enum CodingKeys: String, CodingKey {
		case filename = "filename"
		case language = "language"
		case rawUrl = "raw_url"
		case size = "size"
		case type = "type"
	}
}
