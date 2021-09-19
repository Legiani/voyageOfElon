//
//  APIErrors.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 13.09.2021.
//

import Foundation

enum APIErrors: Error {
    case invalidAPIDeclaration
    case invalidAPIBaseURL
    case invalidAPIEndpoint

    case connectionNotFind
}
