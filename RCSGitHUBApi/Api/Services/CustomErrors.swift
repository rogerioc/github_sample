//
//  CustomErrors.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 11/02/20.
//  Copyright © 2020 rogeriocs. All rights reserved.
//

import Foundation

enum CustomErros {
    case network(type: Types.NetworkError)
    
    class Types {}
}

extension CustomErros.Types {
    enum NetworkError {
        case parsing
        case notFound
        case custom(errorCode: Int?, errorDescription: String?)
    }
}

extension CustomErros.Types.NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .parsing: return "Parsing error"
            case .notFound: return "URL Not Found"
            case .custom(_, let errorDescription): return errorDescription
        }
    }

    var errorCode: Int? {
        switch self {
            case .parsing: return nil
            case .notFound: return 404
            case .custom(let errorCode, _): return errorCode
        }
    }
}
