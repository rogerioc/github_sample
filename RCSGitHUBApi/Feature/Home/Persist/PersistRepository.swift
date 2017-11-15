//
//  PersistRepository.swift
//  RCSGitHUBApi
//
//  Created by Rogerio on 14/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation
import Disk

class PersistRepository:PersistRepositoryProtocol {
    let dataName = "data.json"
    func saveRepositories(data: [ShowGitHubData]) {
//        do {
//            try Disk.append(data, to: dataName, in: .caches)
//        } catch let error as NSError {
//            fatalError("""
//                Domain: \(error.domain)
//                Code: \(error.code)
//                Description: \(error.localizedDescription)
//                Failure Reason: \(error.localizedFailureReason ?? "")
//                Suggestions: \(error.localizedRecoverySuggestion ?? "")
//                """)
//        }
    }
    
    func getDataAll() -> [ShowGitHubData] {
        var datas:[ShowGitHubData]
        do {
            datas =  try Disk.retrieve(dataName, from: .caches, as: [ShowGitHubData].self)
        }catch let error as NSError {
            fatalError("""
                Domain: \(error.domain)
                Code: \(error.code)
                Description: \(error.localizedDescription)
                Failure Reason: \(error.localizedFailureReason ?? "")
                Suggestions: \(error.localizedRecoverySuggestion ?? "")
                """)
        }
        return datas
    }
    
    func deleteData() {
//        do {
//            try Disk.clear(.caches)
//        }catch let error as NSError {
//            fatalError("""
//                Domain: \(error.domain)
//                Code: \(error.code)
//                Description: \(error.localizedDescription)
//                Failure Reason: \(error.localizedFailureReason ?? "")
//                Suggestions: \(error.localizedRecoverySuggestion ?? "")
//                """)
//        }
    }
    
}
