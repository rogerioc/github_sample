//
//  HelperData.swift
//  RCSGitHUBApiTests
//
//  Created by rogerio on 15/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation
import SwiftyJSON

class HelperData {
    static func getFile(name:String) ->  String {
        guard let path = Bundle.main.path(forResource:name, ofType: "json") else {
            return ""
        }
        do {
            let data = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
//            let data:Data = try Data.init(contentsOf: path)
            //let swiftyJsonVar = JSON(data)
            return data
        } catch  let error as NSError {
            fatalError("""
                Domain: \(error.domain)
                Code: \(error.code)
                Description: \(error.localizedDescription)
                Failure Reason: \(error.localizedFailureReason ?? "")
                Suggestions: \(error.localizedRecoverySuggestion ?? "")
                """)
        }
        return ""
    }
}
